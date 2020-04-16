package com.diegoprestes.game.components {
	import com.diegoprestes.game.manager.SaveManager;
	import com.diegoprestes.game.builder.StageBuilder;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.plugin.photonstorm.BaseTypes.Bullet;
	import com.diegoprestes.game.GameObject;
	
	

	/**
	 * @author diegoprestes
	 */
	public class CollisionComponent extends Component implements IComponent {
		public function CollisionComponent() {
			super();
		}
		
		public function onUpdate():void {
		}
		
		public function onMessage(id:String, value:Object = null):void {
			if (id == "overlap") {
				var object:GameObject;
				
				if (value is Bullet) {
					var bullet:Bullet = value as Bullet;
					
					var weapon:FlxWeapon = bullet.getWeapon();
					var damage:Number = Main.INSTANCE.config.getNumber(weapon.name + "_damage");
					
					object = weapon.getParent() as GameObject;
					
					bullet.kill();
					
					owner.sendMessage("applyDamage", damage);
					
					var weaponHit:Number = SaveManager.getInstance().getWeaponHit(weapon.name);
					weaponHit++;
					SaveManager.getInstance().setWeaponHit(weapon.name, weaponHit);
					
					if (weaponHit > Main.INSTANCE.config.getNumber(weapon.name + "_badge")) {
						SaveManager.getInstance().setBadge(weapon.name, "true");
						
						// TODO: checar se tem badge, senao tiver mostrar popup
					}
					
					if (owner.getString("group") == "player" || owner.getString("group") == "enemy")
						StageBuilder.INSTANCE.createBloodParticle(owner);
				} else if (value is GameObject) {
					object = value as GameObject;
					
					if (owner.getString("group") == "player" && object.getString("group") == "enemy") {
						// cpln("PLAYER DIED");
						// TODO: do something when the player collides with enemy;
					}
				}
			}
		}
	}
}