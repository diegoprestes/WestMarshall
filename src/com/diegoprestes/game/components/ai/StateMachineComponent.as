package com.diegoprestes.game.components.ai {
	import br.dcoder.console.ConsoleEvent;
	import br.dcoder.console.Console;
	import com.diegoprestes.game.components.Component;
	import com.diegoprestes.game.components.IComponent;
	import com.diegoprestes.game.GameObject;
	import stateMachine.StateMachine;
	import stateMachine.StateMachineEvent;

	/**
	 * @author diegoprestes
	 */
	public class StateMachineComponent extends Component implements IComponent {
		
		private var machine:StateMachine;
		
		public function StateMachineComponent() {
			super();
			
			Console.getInstance().addEventListener(ConsoleEvent.INPUT, onInput);
		}
		
		private function onInput(event:ConsoleEvent):void {
			var args:Array = event.text.split(" ");
			
			if (args[0] == "machine.change") {
				machine.changeState(args[1]);
			}
		}

		override public function create(owner:GameObject):void {
			super.create(owner);
			
			machine = new StateMachine();
			machine.addState("tracking", {enter: onEnterTracking, exit: onExitTracking});
			machine.addState("shooting", {enter: onEnterShooting, exit: onExitShooting});
			
			machine.initialState = "tracking";
			
			var component:IComponent = owner.addComponent("tracking", "com.diegoprestes.game.components.ai.TrackingComponent");
			component.create(owner);
		}
		
		public function onEnterTracking(event:StateMachineEvent):void {
			var component:IComponent = owner.addComponent("walk", "com.diegoprestes.game.components.ai.WalkComponent");
			component.create(owner);
		}
		
		public function onExitTracking(event:StateMachineEvent):void {
			owner.removeComponent("walk");
		}
		
		public function onEnterShooting(event:StateMachineEvent):void {
			var component:IComponent = owner.addComponent("weapon", "com.diegoprestes.game.components.ai.EnemyWeaponComponent");
			component.create(owner);
		}
		
		public function onExitShooting(event:StateMachineEvent):void {
			owner.removeComponent("weapon");
		}
		
		public function onUpdate():void {
		}
		
		public function onMessage(id:String, value:Object = null):void {
			if (id == "changeState") {
				machine.changeState(String(value));
			}
		}
	}
}