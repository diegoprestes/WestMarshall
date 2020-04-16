package com.diegoprestes.game.screens.episodes {
	import com.diegoprestes.game.manager.SaveManager;
	import com.diegoprestes.game.screens.episodes.HistoryEpisodeScreen;
	import com.diegoprestes.game.screens.stage.StageScreen;

	/**
	 * @author diegoprestes
	 */
	public class Episode2Screen extends HistoryEpisodeScreen {
		public function Episode2Screen() {
			super();
			
			episodeTitleText = Main.INSTANCE.getLabel("history_episode2");
			
			stageDescText = Main.INSTANCE.getLabel("history_episode2_text");
			
			Main.INSTANCE.track("history/episode2");
		}
		
		override protected function onButtonClicked(target:String):void {
			switch (target) {
				case STAGE1:
					Main.INSTANCE.track("history/episode2/stage1");
					
					Main.INSTANCE.changeState(new StageScreen("e02s01"));
					
					break;
				
				case STAGE2:
					Main.INSTANCE.track("history/episode2/stage2");
					
					Main.INSTANCE.changeState(new StageScreen("e02s02"));
					
					break;
				
				case STAGE3:
					Main.INSTANCE.track("history/episode2/stage3");
					
					Main.INSTANCE.changeState(new StageScreen("e02s03"));
					
					break;
				
				default:
					cpln("Error: No button found: " + target);
			}
		}
		
		override protected function updateStages():void {
			if (!Main.INSTANCE.debug) {
				stage2.active = SaveManager.getInstance().getStageFinished("2", "1");
				stage3.active = SaveManager.getInstance().getStageFinished("2", "2");
			}
		}
	}
}