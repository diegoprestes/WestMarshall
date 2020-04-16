package com.diegoprestes.game.screens {
	import com.diegoprestes.game.assets.AssetLibrary;
	import com.diegoprestes.game.manager.SaveManager;
	import com.diegoprestes.game.screens.GameScreen;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;

	/**
	 * @author diegoprestes
	 */
	public class AchievementsScreen extends GameScreen {
		
		private var badges:Array;
		private var badgesMessage:Array; 
		
		private var messageBackground:FlxSprite;
		private var message:FlxText;
		
		private static const BADGE_ON:Number = 1;
		private static const BADGE_OFF:Number = 0.1;
		
		public function AchievementsScreen() {
			titleText = Main.INSTANCE.getLabel("achievements_title");
			
			Main.INSTANCE.track("achievements");
		}
		
		override protected function createItems():void {
			badges = [];
			badgesMessage = [];
			
			var episode1:FlxExtendedSprite = new FlxExtendedSprite(100, 112, AssetLibrary.BadgeEpisode1Class);
			add(episode1); 
			badges.push(episode1);
			badgesMessage.push("badge_episode1");
			episode1.alpha = SaveManager.getInstance().getStageFinished("1", "3") ? BADGE_ON : BADGE_OFF;
			
			var episode2:FlxExtendedSprite = new FlxExtendedSprite(330, 112, AssetLibrary.BadgeEpisode2Class);
			add(episode2);
			badges.push(episode2);
			badgesMessage.push("badge_episode2");
			episode2.alpha = SaveManager.getInstance().getStageFinished("2", "3") ? BADGE_ON : BADGE_OFF;
			
			var episode3:FlxExtendedSprite = new FlxExtendedSprite(560, 112, AssetLibrary.BadgeEpisode3Class);
			add(episode3);
			badges.push(episode3);
			badgesMessage.push("badge_episode3");
			episode3.alpha = SaveManager.getInstance().getStageFinished("3", "3") ? BADGE_ON : BADGE_OFF;
			
			var bandits:FlxExtendedSprite = new FlxExtendedSprite(54, 281, AssetLibrary.BadgeBanditsClass);
			add(bandits);
			badges.push(bandits);
			badgesMessage.push("badge_bandits");
			bandits.alpha = SaveManager.getInstance().getBadge("bandits") ? BADGE_ON : BADGE_OFF;
			
			var indians:FlxExtendedSprite = new FlxExtendedSprite(242, 281, AssetLibrary.BadgeIndiansClass);
			add(indians);
			badges.push(indians);
			badgesMessage.push("badge_indians");
			indians.alpha = SaveManager.getInstance().getBadge("indians") ? BADGE_ON : BADGE_OFF;
			
			var mexicans:FlxExtendedSprite = new FlxExtendedSprite(430, 281, AssetLibrary.BadgeMexicansClass);
			add(mexicans);
			badges.push(mexicans);
			badgesMessage.push("badge_mexicans");
			mexicans.alpha = SaveManager.getInstance().getBadge("mexicans") ? BADGE_ON : BADGE_OFF;
			
			var rare:FlxExtendedSprite = new FlxExtendedSprite(618, 281, AssetLibrary.BadgeRareItemClass);
			add(rare);
			badges.push(rare);
			badgesMessage.push("badge_rare");
			rare.alpha = SaveManager.getInstance().getRareItem() ? BADGE_ON : BADGE_OFF;
			
			var pistol:FlxExtendedSprite = new FlxExtendedSprite(102, 440, AssetLibrary.BadgePistolClass);
			add(pistol);
			badges.push(pistol);
			badgesMessage.push("badge_pistol");
			pistol.alpha = SaveManager.getInstance().getBadge("pistol") ? BADGE_ON : BADGE_OFF;
			
			var revolver:FlxExtendedSprite = new FlxExtendedSprite(261, 440, AssetLibrary.BadgeRevolverClass);
			add(revolver);
			badges.push(revolver);
			badgesMessage.push("badge_revolver");
			revolver.alpha = SaveManager.getInstance().getBadge("revolver") ? BADGE_ON : BADGE_OFF;
			
			var shotgun:FlxExtendedSprite = new FlxExtendedSprite(420, 440, AssetLibrary.BadgeShotgunClass);
			add(shotgun);
			badges.push(shotgun);
			badgesMessage.push("badge_shotgun");
			shotgun.alpha = SaveManager.getInstance().getBadge("shotgun") ? BADGE_ON : BADGE_OFF;
			
			var rifle:FlxExtendedSprite = new FlxExtendedSprite(579, 440, AssetLibrary.BadgeRifleClass);
			add(rifle);
			badges.push(rifle);
			badgesMessage.push("badge_rifle");
			rifle.alpha = SaveManager.getInstance().getBadge("rifle") ? BADGE_ON : BADGE_OFF;
			
			
			messageBackground = new FlxSprite(0, 570, AssetLibrary.BadgeMessageClass);
			messageBackground.visible = false;
			add(messageBackground);
			
			message = new FlxText(10, 579, 780);
			message.visible = false;
			add(message);
		}

		override public function update():void {
			super.update();
			
			var insideBadge:Boolean = false;
			for (var i:int = 0; i < badges.length; i++) {
				var badge:FlxExtendedSprite = badges[i] as FlxExtendedSprite;
				
				var point:FlxPoint = new FlxPoint(Main.INSTANCE.stage.mouseX, Main.INSTANCE.stage.mouseY);
				
				if (badge.overlapsPoint(point)) {
					insideBadge = true;

					messageBackground.visible = true;
					message.visible = true;
					message.text = Main.INSTANCE.getLabel(badgesMessage[i]);
					
					break;
				}
			}
			
			if (!insideBadge) {
				messageBackground.visible = false;
				message.visible = false;
			}
		}

		override protected function onBackClicked():void {
			Main.INSTANCE.changeState(new StartScreen());
		}
	}
}