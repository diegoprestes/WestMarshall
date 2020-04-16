package com.diegoprestes.game.screens {
	import com.diegoprestes.game.screens.GameScreen;

	/**
	 * @author diegoprestes
	 */
	public class MultiplayerScreen extends GameScreen {
		public function MultiplayerScreen() {
			titleText = Main.INSTANCE.getLabel("multiplayer_title");
			
			Main.INSTANCE.track("multiplayer");
		}
		
		override protected function onBackClicked():void {
			Main.INSTANCE.changeState(new StartScreen());
		}
	}
}