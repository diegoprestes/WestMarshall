package com.diegoprestes.game.screens {
	import org.flixel.FlxText;
	import com.diegoprestes.game.assets.AssetLibrary;
	import com.diegoprestes.game.manager.LayoutManager;
	import flash.text.TextFormat;
	import org.flixel.plugin.diegoprestes.FlxButtonDP;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import org.flixel.FlxSprite;

	/**
	 * @author diegoprestes
	 */
	public class StartScreen extends GameScreen {
		
		private var historyButton:FlxButtonDP;
		private var multiplayerButton:FlxButtonDP;
		private var storeButton:FlxButtonDP;
		private var achievementsButton:FlxButtonDP;
		private var controlsButton:FlxButtonDP;
		
		private var usButton:FlxExtendedSprite;
		private var brButton:FlxExtendedSprite;
		
		private var version:FlxText;
		
		public function StartScreen() {
			super();
			
			backEnabled = false;
			
			Main.INSTANCE.track("start");
		}

		override public function create():void {
			super.create();
			
			createFlags();
			
			version = new FlxText(10, 10, 50, "v0.11");
			add(version);
		}
		
		private function createFlags():void {
			usButton = new FlxExtendedSprite(700, 562, AssetLibrary.US);
			usButton.mouseReleasedCallback = onCountryClicked;
			usButton.enableMouseClicks(true);
			add(usButton);
			
			brButton = new FlxExtendedSprite(750, 562, AssetLibrary.BR);
			brButton.mouseReleasedCallback = onCountryClicked;
			brButton.enableMouseClicks(true);
			add(brButton);
		}
		
		private function onCountryClicked(target:FlxExtendedSprite, mouseX:int, mouseY:int):void {
			var country:String = "";
			if (target == usButton)
				country = "us";
			else if (target == brButton)
				country = "br";
			
			var lang:String = Main.INSTANCE.lang;
			
			if ((country == "us" && lang != "en") || (country == "br" && lang != "pt")) {
				if (country == "us")
					Main.INSTANCE.lang = "en";
					
				if (country == "br")
					Main.INSTANCE.lang = "pt";
				
				createItems();
			}
		}

		override protected function createBackground():void {
			add(new FlxSprite(0, 0, AssetLibrary.StartScreenBackground));
		}
		
		override protected function createItems():void {
			var format:TextFormat = LayoutManager.createStartScreenFormat();
			
			if (historyButton) {
				remove(historyButton);
				remove(multiplayerButton);
				remove(storeButton);
				remove(achievementsButton);
				remove(controlsButton);
			}
			
			var buttonX:Number = 300;
			
			var buttonWidth:Number = 200;
			var buttonHeight:Number = 29;
			
			historyButton = new FlxButtonDP(buttonX, 316, onButtonClicked, [GameScreen.HISTORY], Main.INSTANCE.getLabel("start_history_btn"), buttonWidth, buttonHeight, format);
			add(historyButton);
			
			multiplayerButton = new FlxButtonDP(buttonX, 366, onButtonClicked, [GameScreen.MULTIPLAYER], Main.INSTANCE.getLabel("start_multiplayer_btn"), buttonWidth, buttonHeight, format);
			multiplayerButton.active = false;
			add(multiplayerButton);
			
			var comingSoon:FlxSprite = new FlxSprite(450, 356, AssetLibrary.ComingSoonClass);
			add(comingSoon);
			
			storeButton = new FlxButtonDP(buttonX, 416, onButtonClicked, [GameScreen.STORE], Main.INSTANCE.getLabel("start_store_btn"), buttonWidth, buttonHeight, format);
			add(storeButton);
			
			achievementsButton = new FlxButtonDP(buttonX, 466, onButtonClicked, [GameScreen.ACHIEVEMENTS], Main.INSTANCE.getLabel("start_achievements_btn"), buttonWidth, buttonHeight, format);
			add(achievementsButton);
			
			controlsButton = new FlxButtonDP(buttonX, 516, onButtonClicked, [GameScreen.CONTROLS], Main.INSTANCE.getLabel("start_controls_btn"), buttonWidth, buttonHeight, format);
			add(controlsButton);
		}
		
		private function onButtonClicked(target:String):void {
			switch (target) {
				case GameScreen.HISTORY:
					Main.INSTANCE.changeState(new HistoryScreen());
					
					break;
				
				case GameScreen.MULTIPLAYER:
					Main.INSTANCE.changeState(new MultiplayerScreen());
					
					break;
				
				case GameScreen.STORE:
					Main.INSTANCE.changeState(new StoreScreen());
					
					break;
				
				case GameScreen.ACHIEVEMENTS:
					Main.INSTANCE.changeState(new AchievementsScreen());
					
					break;
				
				case GameScreen.CONTROLS:
					Main.INSTANCE.changeState(new ControlsScreen());
					
					break;
				
				default:
					cpln("Error: No button found: " + target);
			}
		}
	}
}