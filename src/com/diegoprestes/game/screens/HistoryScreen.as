package com.diegoprestes.game.screens {
	import com.diegoprestes.game.manager.SaveManager;
	import com.diegoprestes.game.screens.episodes.Episode3Screen;
	import com.diegoprestes.game.screens.episodes.Episode2Screen;
	import com.diegoprestes.game.screens.episodes.Episode1Screen;
	import com.diegoprestes.game.manager.LayoutManager;
	import com.diegoprestes.game.screens.GameScreen;
	import flash.text.TextFormat;
	import org.flixel.plugin.diegoprestes.FlxButtonDP;

	/**
	 * @author diegoprestes
	 */
	public class HistoryScreen extends GameScreen {
		
		private static const EPISODE1:String = "episode1";
		private static const EPISODE2:String = "episode2";
		private static const EPISODE3:String = "episode3";
		
		private var episode1:FlxButtonDP;
		private var episode2:FlxButtonDP;
		private var episode3:FlxButtonDP;
		
		public function HistoryScreen() {
			titleText = Main.INSTANCE.getLabel("history_title");
			
			Main.INSTANCE.track("history");
		}

		override protected function createItems():void {
			var format:TextFormat = LayoutManager.createEpisodeButtonFormat();
			
			var buttonX:Number = 132;
			
			var buttonWidth:Number = 537;
			var buttonHeight:Number = 118;
			
			var offsetX:Number = 0;
			var offsetY:Number = 30;
			
			episode1 = new FlxButtonDP(buttonX, 148, onButtonClicked, [EPISODE1], Main.INSTANCE.getLabel("history_episode1"), buttonWidth, buttonHeight, format);
			episode1.setTextOffset(offsetX, offsetY);
			add(episode1);
			
			episode2 = new FlxButtonDP(buttonX, 286, onButtonClicked, [EPISODE2], Main.INSTANCE.getLabel("history_episode2"), buttonWidth, buttonHeight, format);
			episode2.setTextOffset(offsetX, offsetY);
			add(episode2);
			
			episode3 = new FlxButtonDP(buttonX, 424, onButtonClicked, [EPISODE3], Main.INSTANCE.getLabel("history_episode3"), buttonWidth, buttonHeight, format);
			episode3.setTextOffset(offsetX, offsetY);
			add(episode3);
			
			if (!Main.INSTANCE.debug) {
				episode2.active = SaveManager.getInstance().getStageFinished("1", "3");
				episode3.active = SaveManager.getInstance().getStageFinished("2", "3");
			}
		}
		
		private function onButtonClicked(target:String):void {
			switch (target) {
				case EPISODE1:
					Main.INSTANCE.changeState(new Episode1Screen());
					
					break;
				
				case EPISODE2:
					Main.INSTANCE.changeState(new Episode2Screen());
					
					break;
				
				case EPISODE3:
					Main.INSTANCE.changeState(new Episode3Screen());
					
					break;
				
				default:
					cpln("Error: No button found: " + target);
			}
		}

		override protected function onBackClicked():void {
			Main.INSTANCE.changeState(new StartScreen());
		}
	}
}