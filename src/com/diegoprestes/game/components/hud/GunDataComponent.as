package com.diegoprestes.game.components.hud {
	import com.diegoprestes.game.assets.AssetLibrary;
	import com.diegoprestes.game.builder.StageBuilder;
	import org.flixel.FlxText;
	import com.diegoprestes.game.GameObject;
	import com.diegoprestes.game.components.Component;
	import com.diegoprestes.game.components.IComponent;

	/**
	 * @author diegoprestes
	 */
	public class GunDataComponent extends Component implements IComponent {
		
		private var bullets:FlxText;
		
		public function GunDataComponent() {
			super();
		}

		override public function create(owner:GameObject):void {
			super.create(owner);
			
			owner.visible = false;
			
			bullets = StageBuilder.INSTANCE.createText(58, 63, 100, "", "hud");
		}

		public function onUpdate():void {
		}
		
		public function onMessage(id:String, value:Object = null):void {
		}
		
		override public function onGlobalMessage(id:String, target:String, message:Object):void {
			if (id == "gunChanged") {
				owner.loadGraphic(AssetLibrary.getClass(message["name"] + "_hud"), false, true);
					
				owner.visible = true;
				
				if (message["bullet_total"] == "oo")
					bullets.text = message["bullet_total"];
				else
					bullets.text = message["bullet_number"] + "/" + message["bullet_total"];
			} else if (id == "gunFired") {
				if (message["bullet_total"] == "oo")
					bullets.text = message["bullet_total"];
				else
					bullets.text = message["bullet_number"] + "/" + message["bullet_total"];
			}
		}
	}
}