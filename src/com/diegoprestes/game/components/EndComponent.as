package com.diegoprestes.game.components {
	import com.diegoprestes.game.screens.StartScreen;
	import com.diegoprestes.game.manager.SaveManager;
	import com.diegoprestes.game.builder.StageBuilder;
	import com.diegoprestes.game.GameObject;

	/**
	 * @author diegoprestes
	 */
	public class EndComponent extends Component implements IComponent {
		public function EndComponent() {
			super();
		}
		
		public function onUpdate():void {
		}
		
		public function onMessage(id:String, value:Object = null):void {
			if (id == "overlap") {
				if (value is GameObject) {
					var object:GameObject = value as GameObject;
					
					if (object.getString("group") == "player") {
						finishStage();
					}
				}
			}
		}

		private function finishStage():void {
			var stageData:Object = StageBuilder.INSTANCE.stageData;
			
			SaveManager.getInstance().setStageFinished(stageData["episode"], stageData["stage"], "true");
			
			Main.INSTANCE.changeState(new StartScreen());
		}
	}
}