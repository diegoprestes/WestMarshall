package com.diegoprestes.game.components.hud {
	import com.diegoprestes.game.assets.AssetLibrary;
	import com.diegoprestes.game.builder.StageBuilder;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxDelay;
	import com.diegoprestes.game.GameObject;
	import com.diegoprestes.game.components.Component;
	import com.diegoprestes.game.components.IComponent;

	/**
	 * @author diegoprestes
	 */
	public class CharacterDataComponent extends Component implements IComponent {
		
		private var created:Boolean = false;
		
		private var bar:FlxBar;
		
		private var delay:FlxDelay;
		
		private var delayTime:int = 2000;
		
		public function CharacterDataComponent() {
			super();
		}
		
		override public function create(owner:GameObject):void {
			super.create(owner);
			
			bar = StageBuilder.INSTANCE.createHealthBar(owner.x + 50, owner.y + 10, 0, 1);
			bar.currentValue = 1;
			
			if (getCharacter() == "enemy") {
				created = true;
				
				bar.visible = false;
				owner.visible = false;
				
				delay = new FlxDelay(delayTime);
			}
		}
		
		public function onUpdate():void {
			if (getCharacter() == "player") {
	 			var targetObject:GameObject = StageBuilder.INSTANCE.objects[getCharacter()] as GameObject;
				
				if (targetObject) {
					owner.loadGraphic(AssetLibrary.getClass(targetObject.getString("graphic")), false, true);
					
					var hp:int = targetObject.getNumber("hp");
					var maxhp:int = targetObject.getNumber("maxhp");
					
					bar.setRange(0, maxhp);
					bar.currentValue = hp;
					
					created = true;
				} else {
					cpln("Error: CharacterDataComponent: target player not found.");
				}
			}
			
			if (delay) {
				if (delay.hasExpired) {
					bar.visible = false;
					owner.visible = false;
				}
			}
		}
		
		public function onMessage(id:String, value:Object = null):void {
		}
		
		override public function onGlobalMessage(id:String, target:String, message:Object):void {
			var characterGroup:String = String(message["group"]);
			
			if (id == "updateHealthBar" && characterGroup == getCharacter()) {
				if (getCharacter() == "player") {
					bar.currentValue = Number(message["hp"]);
				} else if (getCharacter() == "enemy") {
					var targetObject:GameObject = StageBuilder.INSTANCE.objects[target] as GameObject;
					bar.setRange(0, targetObject.getNumber("maxhp"));
					
					bar.currentValue = Number(message["hp"]);
					bar.visible = true;
					
					owner.loadGraphic(AssetLibrary.getClass(targetObject.getString("graphic")), false, true);
					owner.visible = true;
					
					delay.reset(delayTime);
				}
			}
		}
		
		private function getCharacter():String {
			return getString("target");
		}
	}
}