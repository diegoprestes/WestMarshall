package com.diegoprestes.game.screens {
	import com.diegoprestes.game.assets.AssetLibrary;
	import com.diegoprestes.game.screens.GameScreen;
	import org.flixel.FlxText;

	/**
	 * @author diegoprestes
	 */
	public class ControlsScreen extends GameScreen {
		public function ControlsScreen() {
			titleText = Main.INSTANCE.getLabel("controls_title");
			
			Main.INSTANCE.track("controls");
		}

		override protected function createItems():void {
			super.createItems();
			
			var moveText:FlxText = new FlxText(162, 150, 520, Main.INSTANCE.getLabel("move"));
			moveText.setFormat(AssetLibrary.WESTERN_FONT, 40, 0x000000);
			add(moveText);
			
			var jumpText:FlxText = new FlxText(162, 230, 520, Main.INSTANCE.getLabel("jump"));
			jumpText.setFormat(AssetLibrary.WESTERN_FONT, 40, 0x000000);
			add(jumpText);
			
			var shootText:FlxText = new FlxText(162, 310, 520, Main.INSTANCE.getLabel("shoot"));
			shootText.setFormat(AssetLibrary.WESTERN_FONT, 40, 0x000000);
			add(shootText);
			
			var runText:FlxText = new FlxText(162, 390, 520, Main.INSTANCE.getLabel("run"));
			runText.setFormat(AssetLibrary.WESTERN_FONT, 40, 0x000000);
			add(runText);
			
			var weaponText:FlxText = new FlxText(162, 470, 520, Main.INSTANCE.getLabel("weapon"));
			weaponText.setFormat(AssetLibrary.WESTERN_FONT, 40, 0x000000);
			add(weaponText);
		}

		override protected function onBackClicked():void {
			Main.INSTANCE.changeState(new StartScreen());
		}
	}
}