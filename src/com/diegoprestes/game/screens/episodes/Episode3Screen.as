package com.diegoprestes.game.screens.episodes {
	import com.diegoprestes.game.manager.SaveManager;
	import com.diegoprestes.game.screens.episodes.HistoryEpisodeScreen;
	import com.diegoprestes.game.screens.stage.StageScreen;

	/**
	 * @author diegoprestes
	 */
	public class Episode3Screen extends HistoryEpisodeScreen {
		public function Episode3Screen() {
			super();
			
			episodeTitleText = Main.INSTANCE.getLabel("history_episode3");
			
			stageDescText = Main.INSTANCE.getLabel("history_episode3_text");
			
			Main.INSTANCE.track("history/episode3");
		}
		
		override protected function onButtonClicked(target:String):void {
			switch (target) {
				case STAGE1:
					Main.INSTANCE.track("history/episode3/stage1");
					
					Main.INSTANCE.changeState(new StageScreen("e03s01"));
					
					break;
				
				case STAGE2:
					Main.INSTANCE.track("history/episode3/stage2");
					
					Main.INSTANCE.changeState(new StageScreen("e03s02"));
					
					break;
				
				case STAGE3:
					Main.INSTANCE.track("history/episode3/stage3");
					
					Main.INSTANCE.changeState(new StageScreen("e03s03"));
					
					break;
				
				default:
					cpln("Error: No button found: " + target);
			}
		}
		
		override protected function updateStages():void {
			if (!Main.INSTANCE.debug) {
				stage2.active = SaveManager.getInstance().getStageFinished("3", "1");
				stage3.active = SaveManager.getInstance().getStageFinished("3", "2");
			}
		}
	}
}