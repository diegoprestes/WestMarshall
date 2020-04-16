package com.diegoprestes.game.components {
	import com.diegoprestes.game.GameObject;
	import com.diegoprestes.game.components.Component;
	import com.diegoprestes.game.components.IComponent;

	/**
	 * @author diegoprestes
	 */
	public class PhysicsComponent extends Component implements IComponent {
		
		public function PhysicsComponent() {
			super();
			
			setValue("accelerationY", Main.INSTANCE.config.getNumber("accelerationY"));
			setValue("dragX", Main.INSTANCE.config.getNumber("dragX"));
			setValue("maxVelocityY", Main.INSTANCE.config.getNumber("maxVelocityY"));
		}
		
		override public function create(owner:GameObject):void {
			super.create(owner);
			
			owner.drag.x = getNumber("dragX");
			owner.acceleration.y = getNumber("accelerationY");
			owner.maxVelocity.y = getNumber("maxVelocityY");
		}
		
		public function onUpdate():void {
		}
		
		public function onMessage(id:String, value:Object = null):void {
		}
	}
}