package com.diegoprestes.game.screens {
	import com.diegoprestes.game.manager.LayoutManager;
	import flash.text.TextFormat;
	import org.flixel.plugin.diegoprestes.FlxButtonDP;
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;

	/**
	 * @author diegoprestes
	 */
	public class GameScreen extends FlxState {
		public static const HISTORY:String = "history";
		public static const MULTIPLAYER:String = "multiplayer";
		public static const STORE:String = "store";
		public static const ACHIEVEMENTS:String = "achievements";
		public static const CONTROLS:String = "controls";
		
		protected var backEnabled:Boolean = true;
		private var backButton:FlxButtonDP;
		
		private var titleField:FlxText;
		protected var titleText:String;

		override public function create():void {
			super.create();
			
			createBackground();
			
			createTitle();
			
			createItems();
			
			if (backEnabled)
				createBackButton();
		}
		
		protected function createBackground():void {
			FlxG.bgColor = Main.INSTANCE.config.getNumber("screen_bg");
		}
		
		protected function createTitle():void {
			if (titleText) {
				var format:TextFormat = LayoutManager.createInsideScreenTitleFormat();
				
				titleField = new FlxText(0, 46, 800, titleText);
				titleField.setFormat(format.font, Number(format.size), Number(format.color), format.align);
				add(titleField);
			}
		}
		
		protected function createItems():void {
		}
		
		private function createBackButton():void {
			var format:TextFormat = LayoutManager.createBackButtonFormat();
			
			var gameWidth:Number = Main.INSTANCE.config.getNumber("game_width");
			
			var buttonWidth:Number = 101;
			var buttonHeight:Number = 29;
			
			backButton = new FlxButtonDP(gameWidth - buttonWidth - 10, 10, onBackClicked, null, Main.INSTANCE.getLabel("back_btn"), buttonWidth, buttonHeight, format);
			add(backButton);
		}
		
		protected function onBackClicked():void {
			cpln("BACK CLICKED");
		}
	}
}