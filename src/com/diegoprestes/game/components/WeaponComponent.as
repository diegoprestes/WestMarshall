package com.diegoprestes.game.components {
	import com.diegoprestes.game.assets.AssetLibrary;
	import com.diegoprestes.game.builder.StageBuilder;
	import com.diegoprestes.game.components.Component;
	import com.diegoprestes.game.components.IComponent;
	import com.diegoprestes.game.manager.SaveManager;
	import com.diegoprestes.game.GameObject;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;

	/**
	 * @author diegoprestes
	 */
	public class WeaponComponent extends Component implements IComponent {
		
		private var activeWeapon:FlxWeapon;
		
		private var pistol:FlxWeapon;
		private var revolver:FlxWeapon;
		private var shotgun:FlxWeapon;
		private var rifle:FlxWeapon;
		
		public function WeaponComponent() {
			super();
		}

		override public function create(owner:GameObject):void {
			super.create(owner);
			
			pistol = StageBuilder.INSTANCE.createWeapon("pistol", owner);
			revolver = StageBuilder.INSTANCE.createWeapon("revolver", owner);
			shotgun = StageBuilder.INSTANCE.createWeapon("shotgun", owner);
			rifle = StageBuilder.INSTANCE.createWeapon("rifle", owner);
			
			activeWeapon = pistol;
			
			StageBuilder.INSTANCE.messageManager.sendGlobalMessage("gunChanged", "", getWeaponData());
		}

		public function onUpdate():void {
			var gunChanged:Boolean = false;
			
			if (FlxG.keys.ONE) {
				activeWeapon = pistol;
				
				gunChanged = true;
			} else if (FlxG.keys.TWO && SaveManager.getInstance().getWeaponEnabled("revolver")) {
				activeWeapon = revolver;
				
				gunChanged = true;
			} else if (FlxG.keys.THREE && SaveManager.getInstance().getWeaponEnabled("shotgun")) {
				activeWeapon = shotgun;
				
				gunChanged = true;
			} else if (FlxG.keys.FOUR && SaveManager.getInstance().getWeaponEnabled("rifle")) {
				activeWeapon = rifle;
				
				gunChanged = true;
			}
			
			if (gunChanged) {
				StageBuilder.INSTANCE.messageManager.sendGlobalMessage("gunChanged", "", getWeaponData());
			}
		}
		
		public function onMessage(id:String, value:Object = null):void {
			if (id == "fire") {
				var bullets:Number = SaveManager.getInstance().getWeaponBullets(activeWeapon.name);
				if (bullets == 0 && Main.INSTANCE.config.getString(activeWeapon.name + "_limit") != "oo")
					return;
				
				var angle:int;
				if (FlxG.keys.UP) {
					if (FlxG.keys.LEFT)
						angle = FlxWeapon.BULLET_NORTH_WEST;
					else if (FlxG.keys.RIGHT)
						angle = FlxWeapon.BULLET_NORTH_EAST;
					else
						angle = FlxWeapon.BULLET_UP;
				} else if (FlxG.keys.DOWN) {
					if (FlxG.keys.LEFT)
						angle = FlxWeapon.BULLET_SOUTH_WEST;
					else if (FlxG.keys.RIGHT)
						angle = FlxWeapon.BULLET_SOUTH_EAST;
					else
						angle = FlxWeapon.BULLET_DOWN;
				} else {
					angle = owner.facing == FlxObject.RIGHT ? FlxWeapon.BULLET_RIGHT : FlxWeapon.BULLET_LEFT;
				}
				
				var speed:Number = Main.INSTANCE.config.getNumber(activeWeapon.name + "_speed");
				
				activeWeapon.setBulletDirection(angle, speed);
				activeWeapon.setBulletBounds(new FlxRect(0, 0, FlxG.worldBounds.width, FlxG.worldBounds.height));
				
				var fired:Boolean = activeWeapon.fire();
				if (fired) {
					FlxG.play(AssetLibrary.getClass(activeWeapon.name + "_sound"));
					
					bullets--;
					
					if (bullets < 0)
						bullets = 0;
					
					SaveManager.getInstance().setWeaponBullets(activeWeapon.name, bullets);
					
					StageBuilder.INSTANCE.messageManager.sendGlobalMessage("gunFired", "", getWeaponData());
				}
			}
		}
		
		private function getWeaponData():Object {
			var data:Object = {};
			data["name"] = activeWeapon.name;
			data["bullet_total"] = Main.INSTANCE.config.getString(activeWeapon.name + "_limit");
			data["bullet_number"] = SaveManager.getInstance().getWeaponBullets(activeWeapon.name);
			
			return data;
		}
	}
}