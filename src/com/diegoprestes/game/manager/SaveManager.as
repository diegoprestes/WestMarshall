package com.diegoprestes.game.manager {
	import br.dcoder.console.ConsoleEvent;
	import br.dcoder.console.Console;
	import org.flixel.FlxSave;

	/**
	 * @author diegoprestes
	 */
	public class SaveManager {
		
		private static var instance:SaveManager = null;
		
		private var save:FlxSave;
		
		public function SaveManager() {
			Console.getInstance().addEventListener(ConsoleEvent.INPUT, consoleInput);	
		}

		public static function getInstance():SaveManager {
			if (instance == null)
				instance = new SaveManager();
			
			return instance;
		}
		
		public function start():void {
			save = new FlxSave();
			save.bind("WM");
		}
		
		public function getWeaponBullets(id:String):Number {
			if (save.data[id + "_bullets"] == null)
				save.data[id + "_bullets"] = 0;
			
			return save.data[id + "_bullets"];
		}
		
		public function setWeaponBullets(id:String, value:Number):void {
			save.data[id + "_bullets"] = value;
		}
		
		public function getWeaponEnabled(id:String):Boolean {
			return save.data[id + "_enabled"] == "true";
		}
		
		public function setWeaponEnabled(id:String, value:String):void {
			save.data[id + "_enabled"] = value;
		}
		
		public function getWeaponHit(id:String):Number {
			if (save.data[id + "_hits"] == null)
				save.data[id + "_hits"] = 0;
			
			return save.data[id + "_hits"];
		}
		
		public function setWeaponHit(id:String, value:Number):void {
			save.data[id + "_hits"] = value;
		}
		
		public function getEnemyKill(id:String):Number {
			if (save.data[id + "_killed"] == null)
				save.data[id + "_killed"] = 0;
			
			return save.data[id + "_killed"];
		}
		
		public function setEnemyKill(id:String, value:Number):void {
			save.data[id + "_killed"] = value;
		}
		
		/**
		 *  Get/Set data if got badge from guns and enemies 
		 */
		public function getBadge(id:String):Boolean {
			return save.data[id + "_badge"] == "true";
		}
		
		public function setBadge(id:String, value:String):void {
			var currentValue:String = save.data[id + "_badge"];
			if ((currentValue == null || currentValue == "false") && value == "true")
				Main.INSTANCE.track("badge/id");
			
			save.data[id + "_badge"] = value;
		}
		
		public function getStageFinished(episode:String, stage:String):Boolean {
			return save.data["e0" + episode + "s0" + stage + "_finished"] == "true";
		}
		
		public function setStageFinished(episode:String, stage:String, value:String):void {
			var currentValue:String = save.data["e0" + episode + "s0" + stage + "_finished"];
			if ((currentValue == null || currentValue == "false") && value == "true" && stage == "3")
				Main.INSTANCE.track("badge/e0" + episode + "s0" + stage);
			
			save.data["e0" + episode + "s0" + stage + "_finished"] = value;
		}
		
		public function getRareItem():Boolean {
			return save.data["rare_item"] == "true";
		}
		
		public function setRareItem(value:String):void {
			var currentValue:String = save.data["rare_item"];
			if ((currentValue == null || currentValue == "false") && value == "true")
				Main.INSTANCE.track("badge/rare");
			
			save.data["rare_item"] = value;
		}
		
		public function getMoney():Number {
			// TODO: put back to 0 of money
			if (save.data["money"] == null)
				save.data["money"] = 4000;
			
			return save.data["money"];
		}
		
		public function setMoney(money:Number):void {
			save.data["money"] = money;
		}
		
		public function addMoney(money:Number):void {
			var current:Number = getMoney();
			current += money;
			
			save.data["money"] = current;
		}
		
		public function removeMoney(money:Number):void {
			var current:Number = getMoney();
			current -= money;
			
			save.data["money"] = current;
		}
		
		public function dataToStore():void {
			// how many bullets each weapon has
			save.data["pistol_bullets"];
			save.data["revolver_bullets"];
			save.data["shotgun_bullets"];
			save.data["rifle_bullets"];
			
			// if user has the weapon
			save.data["pistol_enabled"];
			save.data["revolver_enabled"];
			save.data["shotgun_enabled"];
			save.data["rifle_enabled"];
			
			// how many hits each weapon did
			save.data["pistol_hits"];
			save.data["revolver_hits"];
			save.data["shotgun_hits"];
			save.data["rifle_hits"];
			
			// how many enemies killed
			save.data["bandits_killed"];
			save.data["indians_killed"];
			save.data["mexicans_killed"];
			
			// badge guns
			save.data["pistol_badge"];
			save.data["revolver_badge"];
			save.data["shotgun_badge"];
			save.data["rifle_badge"];
			
			// badge enemies
			save.data["bandits_badge"];
			save.data["indians_badge"];
			save.data["mexicans_badge"];
			
			// if the stages are finished
			save.data["e01s01_finished"];
			save.data["e01s02_finished"];
			save.data["e01s03_finished"];
			
			save.data["e02s01_finished"];
			save.data["e02s02_finished"];
			save.data["e02s03_finished"];
			
			save.data["e03s01_finished"];
			save.data["e03s02_finished"];
			save.data["e03s03_finished"];
			
			// if user got a rare item
			save.data["rare_item"];
			
			save.data["money"];
		}
		
		private function consoleInput(event:ConsoleEvent):void {
			var args:Array = event.text.split(" ");
			
			if (args[0] == "save.get") {
				if (args[1]) {
					cpln("Data for " + args[1] + ": " + save.data[args[1]]);
				} else {
					cpln("missing save.get parameter");
				}
			} else if (args[0] == "save.set") {
				if (args[1] && args[2]) {
					save.data[args[1]] = args[2];
					
					cpln("data saved");
				} else {
					cpln("missing sage.set parameters");
				}
			} else if (args[0] == "save.setNumber") {
				if (args[1] && args[2]) {
					save.data[args[1]] = Number(args[2]);
					
					cpln("data number saved");
				} else {
					cpln("missing sage.set parameters");
				}
			} else if (args[0] == "save.clear") {
				save.erase();
				
				cpln("All data cleared, please refresh the page.");
			} else if (args[0] == "save.data") {
				cpln("Pistol Bullet = " + getWeaponBullets("pistol"));
				cpln("Revolver Bullet = " + getWeaponBullets("revolver"));
				cpln("Shotgun Bullet = " + getWeaponBullets("shotgun"));
				cpln("Rifle Bullet = " + getWeaponBullets("rifle"));
				cpln("==========");
				cpln("Pistol Enabled = " + getWeaponEnabled("pistol"));
				cpln("Revolver Enabled = " + getWeaponEnabled("revolver"));
				cpln("Shotgun Enabled = " + getWeaponEnabled("shotgun"));
				cpln("Rifle Enabled = " + getWeaponEnabled("rifle"));
				cpln("==========");
				cpln("Pistol Hits = " + getWeaponHit("pistol"));
				cpln("Revolver Hits = " + getWeaponHit("revolver"));
				cpln("Shotgun Hits = " + getWeaponHit("shotgun"));
				cpln("Rifle Hits = " + getWeaponHit("rifle"));
				cpln("==========");
				cpln("Bandits Killed = " + getEnemyKill("bandit"));
				cpln("Indians Killed = " + getEnemyKill("indian"));
				cpln("Mexicans Killed = " + getEnemyKill("mexican"));
				cpln("==========");
				cpln("S01E01 Finished = " + getStageFinished("1", "1"));
				cpln("S01E02 Finished = " + getStageFinished("1", "2"));
				cpln("S01E03 Finished = " + getStageFinished("1", "3"));
				cpln("S02E01 Finished = " + getStageFinished("2", "1"));
				cpln("S02E02 Finished = " + getStageFinished("2", "2"));
				cpln("S02E03 Finished = " + getStageFinished("2", "3"));
				cpln("S03E01 Finished = " + getStageFinished("3", "1"));
				cpln("S03E02 Finished = " + getStageFinished("3", "2"));
				cpln("S03E03 Finished = " + getStageFinished("3", "3"));
				cpln("==========");
				cpln("Rare Item = " + getRareItem());
			} else if (args[0] == "help") {
				cpln("* console save commands:");
				cpln("  - save.get [key]:");
				cpln("    gets some data from the save");
				cpln("  - save.set [key] [value]:");
				cpln("    sets some data to the save");
				cpln("  - save.setNumber [key] [value]:");
				cpln("    sets some data as number to the save");
				cpln("  - save.clear:");
				cpln("    deletes all data saved from the game");
				cpln("  - save.data:");
				cpln("    shows the data saved");
			}
		}
	}
}