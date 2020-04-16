package com.diegoprestes.game.components {
	import org.flixel.FlxObject;
	import org.flixel.FlxG;
	import com.diegoprestes.game.GameObject;
	import com.diegoprestes.game.components.Component;
	import com.diegoprestes.game.components.IComponent;

	/**
	 * @author diegoprestes
	 */
	public class JumpComponent extends Component implements IComponent {
		public function JumpComponent() {
			super();
		}
		
		override public function create(owner:GameObject):void {
			super.create(owner);
		}
		
		public function onUpdate():void {
			input();
		}
		
		private function input():void {
			if ((FlxG.keys.justPressed("W") || FlxG.keys.justPressed("SPACE")) && owner.touching & FlxObject.DOWN) {
				owner.velocity.y = Main.INSTANCE.config.getNumber("jump_speed");
			}
		}

		public function onMessage(id:String, value:Object = null):void {
		}
	}
}