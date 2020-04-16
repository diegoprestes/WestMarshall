package com.diegoprestes.game.components {
	import com.diegoprestes.game.assets.AssetLibrary;
	import com.diegoprestes.game.builder.StageBuilder;
	import com.diegoprestes.game.GameObject;
	import org.flixel.FlxG;
	
	/**
	 * @author diegoprestes
	 */
	public class DropComponent extends Component implements IComponent {
		
		private var items:Array;
		
		public function DropComponent() {
			super();
		}

		override public function create(owner:GameObject):void {
			super.create(owner);
			
			items = [];
			for (var i:int = 0; i < getValues().length; i++) {
				var key:String = getValues()[i][0];
				
				if (key != "id")
					items.push([key, getNumber(key)]);
			}
			
			items.sort(sortOnPerc);
		}
		
		private function sortOnPerc(a:Array, b:Array):Number {
		    var aPerc:Number = a[1];
		    var bPerc:Number = b[1];
		
		    if (aPerc > bPerc) {
		        return 1;
		    } else if(aPerc < bPerc) {
		        return -1;
		    } else  {
		        return 0;
		    }
		}

		public function onUpdate():void {
		}
		
		public function onMessage(id:String, value:Object = null):void {
			if (id == "died") {
				if (owner.getString("die_sound") != "null")
					FlxG.play(AssetLibrary.getClass(owner.getString("die_sound")));
				
				var dice:Number = Math.random();
				
				var itemId:String;
				var luck:String;
				for (var i:int = 0; i < items.length; i++) {
					if (dice <= items[i][1]) {
						itemId = items[i][0];
						luck = items[i][1];
						
						break;
					}
				}
				
				if (itemId) {
					var data:Object = {};
					
					data["graphic"] = itemId;
					data["type"] = itemId;
					data["luck"] = luck;
					if (itemId.substr(0, 5) == "money") {
						var moneyValue:Number = Number(itemId.split("_")[1]);
						
						data["money"] = moneyValue;
						data["graphic"] = "money";
						data["type"] = "money";
					} else if (itemId == "gold") {
						data["money"] = 500;
						data["type"] = "money";
					}
					
					StageBuilder.INSTANCE.createItem(data, owner);
				}
			}
		}
	}
}