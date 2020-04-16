package com.diegoprestes.game.screens.episodes {
	import com.diegoprestes.game.manager.SaveManager;
	import com.diegoprestes.game.screens.episodes.HistoryEpisodeScreen;
	import com.diegoprestes.game.screens.stage.StageScreen;

	/**
	 * @author diegoprestes
	 */
	public class Episode1Screen extends HistoryEpisodeScreen {
		public function Episode1Screen() {
			super();
			
			episodeTitleText = Main.INSTANCE.getLabel("history_episode1");
			
			stageDescText = Main.INSTANCE.getLabel("history_episode1_text");
			
			Main.INSTANCE.track("history/episode1");
		}

		override protected function onButtonClicked(target:String):void {
			switch (target) {
				case STAGE1:
					Main.INSTANCE.track("history/episode1/stage1");
					
					Main.INSTANCE.changeState(new StageScreen("e01s01"));
					
					break;
				
				case STAGE2:
					Main.INSTANCE.track("history/episode1/stage2");
					
					Main.INSTANCE.changeState(new StageScreen("e01s02"));
					
					break;
				
				case STAGE3:
					Main.INSTANCE.track("history/episode1/stage3");
					
					Main.INSTANCE.changeState(new StageScreen("e01s03"));
					
					break;
				
				default:
					cpln("Error: No button found: " + target);
			}
		}
		
		override protected function updateStages():void {
			if (!Main.INSTANCE.debug) {
				stage2.active = SaveManager.getInstance().getStageFinished("1", "1");
				stage3.active = SaveManager.getInstance().getStageFinished("1", "2");
			}
		}
	}
}