package com.diegoprestes.game.screens.episodes {
	import com.diegoprestes.game.manager.LayoutManager;
	import com.diegoprestes.game.screens.GameScreen;
	import com.diegoprestes.game.screens.HistoryScreen;
	import flash.text.TextFormat;
	import org.flixel.plugin.diegoprestes.FlxButtonDP;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;

	/**
	 * @author diegoprestes
	 */
	public class HistoryEpisodeScreen extends GameScreen {
		
		private var episodeTitleField:FlxText;
		protected var episodeTitleText:String;
		
		private var stageField:FlxText;
		private var stageText:String;
		
		private var stageDescField:FlxText;
		protected var stageDescText:String;
		
		protected static const STAGE1:String = "stage1";
		protected static const STAGE2:String = "stage2";
		protected static const STAGE3:String = "stage3";
		
		protected var stage1:FlxButtonDP;
		protected var stage2:FlxButtonDP;
		protected var stage3:FlxButtonDP;
		
		public function HistoryEpisodeScreen() {
			titleText = Main.INSTANCE.getLabel("history_title");
			
			stageText = Main.INSTANCE.getLabel("history_episode_stage");
		}

		override protected function createTitle():void {
			super.createTitle();
			
			var episodeFormat:TextFormat = LayoutManager.createEpisodeTitleFormat();
			episodeTitleField = new FlxText(0, 119, 800, episodeTitleText);
			episodeTitleField.setFormat(episodeFormat.font, Number(episodeFormat.size), Number(episodeFormat.color), episodeFormat.align);
			add(episodeTitleField);
			
			var stageFormat:TextFormat = LayoutManager.createStageTitleFormat();
			stageField = new FlxText(0, 178, 800, stageText);
			stageField.setFormat(stageFormat.font, Number(stageFormat.size), Number(stageFormat.color), stageFormat.align);
			add(stageField);
		}

		override protected function createItems():void {
			var format:TextFormat = LayoutManager.createStageButtonFormat();
			
			var buttonY:Number = 237;
			
			var buttonWidth:Number = 180;
			var buttonHeight:Number = 120;
			
			var offsetX:Number = 0;
			var offsetY:Number = 36;
			
			stage1 = new FlxButtonDP(100, buttonY, onButtonClicked, [STAGE1], Main.INSTANCE.getLabel("history_stage1_text"), buttonWidth, buttonHeight, format);
			stage1.setTextOffset(offsetX, offsetY);
			add(stage1);
			
			stage2 = new FlxButtonDP(310, buttonY, onButtonClicked, [STAGE2], Main.INSTANCE.getLabel("history_stage2_text"), buttonWidth, buttonHeight, format);
			stage2.setTextOffset(offsetX, offsetY);
			add(stage2);
			
			stage3 = new FlxButtonDP(520, buttonY, onButtonClicked, [STAGE3], Main.INSTANCE.getLabel("history_stage3_text"), buttonWidth, buttonHeight, format);
			stage3.setTextOffset(offsetX, offsetY);
			add(stage3);
			
			var box:FlxSprite = new FlxSprite(100, 377);
			box.makeGraphic(600, 203, 0xFFCCCCCC);
			add(box);
			
			var descFormat:TextFormat = LayoutManager.createStageDescFormat();
			
			stageDescField = new FlxText(122, 396, 553, stageDescText);
			stageDescField.setFormat(descFormat.font, Number(descFormat.size), Number(descFormat.color), descFormat.align);
			add(stageDescField);
			
			updateStages();
		}

		protected function updateStages():void {
		}

		protected function onButtonClicked(target:String):void {
			
		}

		override protected function onBackClicked():void {
			Main.INSTANCE.changeState(new HistoryScreen());
		}
	}
}