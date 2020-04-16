package {
	import flash.events.Event;
	import com.google.analytics.AnalyticsTracker;
	import com.google.analytics.GATracker;
	import com.diegoprestes.game.manager.SaveManager;
	import com.diegoprestes.game.screens.episodes.Episode1Screen;
	import com.diegoprestes.game.screens.StartScreen;
	import br.dcoder.console.plugin.CodeEval;
	import br.dcoder.console.Console;
	import br.dcoder.console.ConsoleEvent;
	import com.diegoprestes.game.manager.DictionaryManager;
	import com.diegoprestes.game.assets.AssetLibrary;
	import com.diegoprestes.game.LibIncluder;
	import flash.geom.Rectangle;
	import flash.utils.getDefinitionByName;
	import org.flixel.plugin.photonstorm.FlxMouseControl;
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	import org.flixel.FlxState;

	/**
	 * @author diegoprestes
	 */
	
	[SWF(width="800", height="600", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]
	public class Main extends FlxGame {
		
		public static var INSTANCE:Main;
		
		private var language:DictionaryManager;
		public var config:DictionaryManager;
		
		private var tracker:AnalyticsTracker;
		
		public var lang:String;
		
		public var debug:Boolean = true;
		
		public function Main() {
			INSTANCE = this;
			
			new LibIncluder();
			
			language = new DictionaryManager(AssetLibrary.LANGUAGE);
			config = new DictionaryManager(AssetLibrary.CONFIG);
			
			lang = config.getString("default_lang");
			
			var gameWidth:Number = config.getNumber("game_width");
			var gameHeight:Number = config.getNumber("game_height");
			var gameZoom:Number = config.getNumber("game_zoom");
			var gameFramerate:Number = config.getNumber("game_framerate");
			var flashFramerate:Number = config.getNumber("flash_framerate");
			
			super(gameWidth, gameHeight, Episode1Screen, gameZoom, gameFramerate, flashFramerate, true);
			
			FlxG.addPlugin(new FlxMouseControl());
			
			forceDebugger = true;
			
			if (stage)
				start();
			else
				addEventListener(Event.ADDED_TO_STAGE, start);
		}
		
		private function start(event:Event = null):void {
			initTracker();
			
			initConsole();
			
			for (var param:String in loaderInfo.parameters) {
				cpln("Load Vars Parameter = " + param + " > " + loaderInfo.parameters[param]);
				
				// TODO: remove comments
				//if (param == "debug")
				//	debug = loaderInfo.parameters[param] == "true" ? true : false;
			}
			
			SaveManager.getInstance().start();
		}

		private function initTracker():void {
			tracker = new GATracker(this, "UA-27305963-2", "AS3", false); 
		}

		public function changeState(state:FlxState):void {
			FlxG.switchState(state);
		}
		
		public function getLabel(id:String):String {
			return language.getString(id + "_" + lang);
		}
		
		public function track(id:String):void {
			 tracker.trackPageview("/" + id); 
		}
		
		private function initConsole():void {
			// start console
			Console.TRACE_ECHO = true;
			Console.create(stage);
			
			// setup console
			Console.getInstance().alpha = 0.9;
			Console.getInstance().area = new Rectangle(50, 50, stage.stageWidth - 100, stage.stageHeight - 100);
			Console.getInstance().hide();
			Console.getInstance().addEventListener(ConsoleEvent.INPUT, consoleInput);
			
			// start console plugins
			CodeEval.start(this);
		}
		
		private function consoleInput(event:ConsoleEvent):void {
			var args:Array = event.text.split(" ");
			
			if (args[0] == "main.goto") {
				if (args[1]) {
					try {
						var ScreenClass:Class = getDefinitionByName(args[1]) as Class;
						changeState(new ScreenClass());
					} catch (e:Error) {
						cpln("Error: Class not found: " + args[1]);
					}
				} else {
					cpln("missing main.goto parameter");
				}
			} else if (args[0] == "help") {
				cpln("* console main commands:");
				cpln("  - main.goto [value]:");
				cpln("    changes to the choosed game screen");
			}
		}
	}
}