package com.diegoprestes.game.components.ai {
	import com.diegoprestes.game.builder.StageBuilder;
	import com.diegoprestes.game.components.Component;
	import com.diegoprestes.game.components.IComponent;
	import com.diegoprestes.game.GameObject;
	import org.flixel.FlxObject;

	/**
	 * @author diegoprestes
	 */
	public class WalkComponent extends Component implements IComponent {
		
		private var speed:Number;
		
		public function WalkComponent() {
			super();
		}

		override public function create(owner:GameObject):void {
			super.create(owner);
			
			speed = Main.INSTANCE.config.getNumber("enemy_speed");
			
			if (owner.facing == FlxObject.RIGHT) {
				owner.velocity.x = speed;
			} else {
				owner.velocity.x = -speed;
			}
			
			owner.drag.x = 0; 
		}
		
		override public function destroy():void {
			owner.velocity.x = 0;
		}

		public function onUpdate():void {
			var tileSize:Number = Main.INSTANCE.config.getNumber("tile_size");
			
			// get the tile numbers
			var tx:int = int(owner.x / tileSize);
			var ty:int = int(owner.y / tileSize);
			
			// get the tile under the char and next to it, to find a hole
			ty++;
			if (owner.facing == FlxObject.RIGHT)
				tx++;
			else
				tx--;
			
			var nextTile:uint = StageBuilder.INSTANCE.map.getTile(tx, ty);
			// if tile is 0, then its a hole
			if (nextTile == 0) {
				var doTurn:Boolean = true;
				if (owner.facing == FlxObject.LEFT) {
					if (Math.floor(owner.x) > (tx + 1) * tileSize)
						doTurn = false;
				}
				
				if (doTurn)
					turn();
			}
			
			if (owner.isTouching(FlxObject.LEFT) || owner.isTouching(FlxObject.RIGHT)) {
				turn();
			}
		}
		
		private function turn():void {
			if (owner.facing == FlxObject.RIGHT) {
				owner.velocity.x = -speed;
				
				owner.facing = FlxObject.LEFT;
			} else {
				owner.velocity.x = speed;
				
				owner.facing = FlxObject.RIGHT;
			}
		}

		public function onMessage(id:String, value:Object = null):void {
		}
	}
}