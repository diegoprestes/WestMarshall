package com.diegoprestes.game.components {
	import br.dcoder.console.ConsoleEvent;
	import br.dcoder.console.Console;
	import org.flixel.FlxObject;
	import org.flixel.FlxG;
	
	/**
	 * @author diegoprestes
	 */
	public class KeyboardComponent extends Component implements IComponent {
		
		private var running:Boolean = false;
		
		public function KeyboardComponent() {
			super();
			
			Console.getInstance().addEventListener(ConsoleEvent.INPUT, consoleInput);
		}

		private function consoleInput(event:ConsoleEvent):void {
			var args:Array = event.text.split(" ");
			
			if (args[0] == "player.getpos") {
				cpln("Player position: " + owner.x + " - " + owner.y);
			} else if (args[0] == "help") {
				cpln("* console player commands:");
				cpln("  - player.getpos:");
				cpln("    gets the position x and y from the player on stage");
			}
		}

		public function onUpdate():void {
			running = false;
			if (FlxG.keys.SHIFT)
				running = true;
			
			if (FlxG.keys.CONTROL)
				owner.sendMessage("fire");
			
			if (FlxG.keys.D || FlxG.keys.RIGHT) {
				owner.velocity.x = Main.INSTANCE.config.getNumber(running ? "run_speed" : "walk_speed");
				owner.facing = FlxObject.RIGHT;
				owner.play("walk");
			} else if (FlxG.keys.A || FlxG.keys.LEFT) {
				owner.velocity.x = -Main.INSTANCE.config.getNumber(running ? "run_speed" : "walk_speed");
				owner.facing = FlxObject.LEFT;
				owner.play("walk");
			} else {
				owner.velocity.x = 0;
				owner.play("stand");
			}
		}

		public function onMessage(id:String, value:Object = null):void {
		}
	}
}