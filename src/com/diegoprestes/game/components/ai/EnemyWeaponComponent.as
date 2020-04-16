package com.diegoprestes.game.components.ai {
	import com.diegoprestes.game.assets.AssetLibrary;
	import org.flixel.FlxG;
	import org.flixel.FlxRect;
	import com.diegoprestes.game.builder.StageBuilder;
	import com.diegoprestes.game.GameObject;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import com.diegoprestes.game.components.Component;
	import com.diegoprestes.game.components.IComponent;

	/**
	 * @author diegoprestes
	 */
	public class EnemyWeaponComponent extends Component implements IComponent {
		
		private var activeWeapon:FlxWeapon;
		
		public function EnemyWeaponComponent() {
			super();
		}
		
		override public function create(owner:GameObject):void {
			super.create(owner);
			
			activeWeapon = StageBuilder.INSTANCE.createWeapon("pistol", owner);
		}
		
		public function onUpdate():void {
			if (owner.getString("target") != "") {
				fire();
			}
		}
		
		private function fire():void {
			var speed:Number = Main.INSTANCE.config.getNumber(activeWeapon.name + "_speed");
			var angle:int = owner.getNumber("target");
			
			activeWeapon.setBulletDirection(angle, speed);
			activeWeapon.setBulletBounds(new FlxRect(0, 0, FlxG.worldBounds.width, FlxG.worldBounds.height));
			
			var fired:Boolean = activeWeapon.fire();
			if (fired) {
				FlxG.play(AssetLibrary.getClass(activeWeapon.name + "_sound"));
			}
		}

		public function onMessage(id:String, value:Object = null):void {
		}
	}
}