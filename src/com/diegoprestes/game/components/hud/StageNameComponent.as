package com.diegoprestes.game.components.hud {
	import com.diegoprestes.game.manager.SaveManager;
	import org.flixel.FlxText;
	import com.diegoprestes.game.builder.StageBuilder;
	import com.diegoprestes.game.GameObject;
	import com.diegoprestes.game.components.Component;
	import com.diegoprestes.game.components.IComponent;

	/**
	 * @author diegoprestes
	 */
	public class StageNameComponent extends Component implements IComponent {
		
		private var money:FlxText;
		
		private var checkOnUpdate:Boolean = false;
		
		public function StageNameComponent() {
			super();
		}
		
		override public function create(owner:GameObject):void {
			super.create(owner);
			
			owner.visible = false;
			
			if (StageBuilder.INSTANCE.stageData["episode"] == null) {
				checkOnUpdate = true;
			} else {
				updateLabel();
			}
			
			money = StageBuilder.INSTANCE.createText(owner.x + 380, owner.y, 100, "", "hud");
			
			updateMoney();
		}

		private function updateLabel():void {
			var label:String = "";
			
			var episode:String = StageBuilder.INSTANCE.stageData["episode"];
			var stage:String = StageBuilder.INSTANCE.stageData["stage"];
			
			label = Main.INSTANCE.getLabel("episode_text") + " " + episode + " " + Main.INSTANCE.getLabel("stage_text") + " " + stage; 
			
			var text:FlxText = StageBuilder.INSTANCE.createText(owner.x, owner.y, 200, label, "hud");
			text.x = Math.round(Main.INSTANCE.config.getNumber("game_width") / 2 - text.realWidth / 2);
		}

		public function onUpdate():void {
			if (StageBuilder.INSTANCE.stageData["episode"] != null && checkOnUpdate) {
				checkOnUpdate = false;
				
				updateLabel();
			}
		}
		
		public function onMessage(id:String, value:Object = null):void {
		}

		override public function onGlobalMessage(id : String, target : String, message : Object) : void {
			super.onGlobalMessage(id, target, message);
			
			if (id == "moneyChanged") {
				updateMoney();
			}
		}

		private function updateMoney():void {
			money.text = "$" + SaveManager.getInstance().getMoney();
		}
	}
}