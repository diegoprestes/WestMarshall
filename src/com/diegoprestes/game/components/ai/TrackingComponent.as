package com.diegoprestes.game.components.ai {
	import com.diegoprestes.game.builder.StageBuilder;
	import com.diegoprestes.game.components.Component;
	import com.diegoprestes.game.components.IComponent;
	import com.diegoprestes.game.GameObject;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;

	/**
	 * @author diegoprestes
	 */
	public class TrackingComponent extends Component implements IComponent {
		
		private var tileSize:int;
		
		private var sight:int;
		
		private var tileX:int;
		private var tileY:int;
		
		public function TrackingComponent() {
			super();
		}

		override public function create(owner:GameObject):void {
			super.create(owner);
			
			owner.setValue("target", "");
			
			tileSize = Main.INSTANCE.config.getNumber("tile_size");
			
			sight = Main.INSTANCE.config.getNumber("enemy_sight");
		}

		public function onUpdate():void {
			// get the tile numbers
			tileX = int(owner.x / tileSize);
			tileY = int(owner.y / tileSize);
			
			var currentTarget:String = owner.getString("target");
			if (owner.facing == FlxObject.RIGHT) {
				if (trackRight()) {
					owner.setValue("target", FlxWeapon.BULLET_RIGHT);
				} else if (trackUpRight()) {
					owner.setValue("target", FlxWeapon.BULLET_NORTH_EAST);
				} else if (trackDownRight()) {
					owner.setValue("target", FlxWeapon.BULLET_SOUTH_EAST);
				} else if (trackUp()) {
					owner.setValue("target", FlxWeapon.BULLET_UP);
				} else {
					owner.setValue("target", "");
				}
			} else {
				if (trackLeft()) {
					owner.setValue("target", FlxWeapon.BULLET_LEFT);
				} else if (trackUpLeft()) {
					owner.setValue("target", FlxWeapon.BULLET_NORTH_WEST);
				} else if (trackDownLeft()) {
					owner.setValue("target", FlxWeapon.BULLET_SOUTH_WEST);
				} else if (trackUp()) {
					owner.setValue("target", FlxWeapon.BULLET_UP);
				} else {
					owner.setValue("target", "");
				}
			}
			
			if (currentTarget != owner.getString("target")) {
				if (owner.getString("target") == "")
					owner.sendMessage("changeState", "tracking");
				else
					owner.sendMessage("changeState", "shooting");
			}
		}
		
		private function trackRight():Boolean {
			var list:Array = [];
			
			var tx:int = tileX + 1;
			var ty:int = tileY;
			for (var i:int = 0; i < sight; i++) {
				list.push([tx, ty]);
				
				tx++;
			}
			
			return track(list);
		}

		private function trackUpRight():Boolean {
			var list:Array = [];
			
			var tx:int = tileX + 1;
			var ty:int = tileY - 1;
			for (var i:int = 0; i < sight; i++) {
				list.push([tx, ty]);
				
				tx++;
				ty--;
			}
			
			return track(list);
		}

		private function trackDownRight():Boolean {
			var list:Array = [];
			
			var tx:int = tileX + 1;
			var ty:int = tileY + 1;
			for (var i:int = 0; i < sight; i++) {
				list.push([tx, ty]);
				
				tx++;
				ty++;
			}
			
			return track(list);
		}

		private function trackLeft():Boolean {
			var list:Array = [];
			
			var tx:int = tileX - 1;
			var ty:int = tileY;
			for (var i:int = 0; i < sight; i++) {
				list.push([tx, ty]);
				
				tx--;
			}
			
			return track(list);
		}

		private function trackUpLeft():Boolean {
			var list:Array = [];
			
			var tx:int = tileX - 1;
			var ty:int = tileY - 1;
			for (var i:int = 0; i < sight; i++) {
				list.push([tx, ty]);
				
				tx--;
				ty--;
			}
			
			return track(list);
		}

		private function trackDownLeft():Boolean {
			var list:Array = [];
			
			var tx:int = tileX - 1;
			var ty:int = tileY + 1;
			for (var i:int = 0; i < sight; i++) {
				list.push([tx, ty]);
				
				tx--;
				ty++;
			}
			
			return track(list);
		}

		private function trackUp():Boolean {
			var list:Array = [];
			
			var tx:int = tileX;
			var ty:int = tileY - 1;
			for (var i:int = 0; i < sight; i++) {
				list.push([tx, ty]);
				
				ty--;
			}
			
			return track(list);
		}
		
		private function track(list:Array):Boolean {
			var player:GameObject = StageBuilder.INSTANCE.player;
			
			if (!player)
				return false;
			
			for (var i:int = 0; i < list.length; i++) {
				var tx:int = Number(list[i][0]);
				var ty:int = Number(list[i][1]);
				
				var rect:FlxRect = new FlxRect(tx * tileSize, ty * tileSize, tileSize, tileSize);
				
				// if one of the tiles in the list is different then 0, then there is a wall in the path
				if (StageBuilder.INSTANCE.map.getTile(tx, ty) != 0)
					return false;
				
				// if the rect of the player overlaps the rect of the tile then the enemy found you
				if (player.rect.overlaps(rect))
					return true;
			}
			
			return false;
		}

		public function onMessage(id:String, value:Object = null):void {
		}
	}
}