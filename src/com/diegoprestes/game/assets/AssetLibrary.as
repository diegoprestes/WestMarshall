package com.diegoprestes.game.assets {

	/**
	 * @author dprestes
	 */
	public class AssetLibrary {
		
		/*** EMBED ***/
		[Embed(source="../../../../../sfx/xml/config.xml", mimeType="application/octet-stream")] public static const CONFIG:Class;
		
		[Embed(source="../../../../../sfx/xml/lang.xml", mimeType="application/octet-stream")] public static const LANGUAGE:Class;
		
		[Embed(source="../../../../../sfx/sprites/us.jpg")] public static var US:Class;
		[Embed(source="../../../../../sfx/sprites/br.jpg")] public static var BR:Class;
		
		[Embed(source="../../../../../sfx/StartScreenBackground.jpg")] public static var StartScreenBackground:Class;
		
		
		/*** FONTS ***/
		[Embed(source="../../../../../sfx/fonts/WEST____.ttf", fontName="Western", mimeType="application/x-font-truetype")]
		private static const WesternFontClass:Class;
		public static const WESTERN_FONT:String = "Western";
		
		[Embed(source="../../../../../sfx/fonts/Anderson Thunderbirds Are GO!.ttf", fontName="Anderson Thunderbirds Are GO!", mimeType="application/x-font-truetype")]
		private static const AndersonThunderbirdsFontClass:Class;
		public static const ANDERSON_THUNDERBIRDS_FONT:String = "Anderson Thunderbirds Are GO!";
		
		
		/*** STAGES ***/
		[Embed(source="../../../../../sfx/xml/stages/default.xml", mimeType="application/octet-stream")] private static var XMLDefaultClass:Class;
		public static const XMLDefault:String = "xml_default";
		
		[Embed(source="../../../../../sfx/sprites/stages/e01s01.png")] private static var MapE01S01Class:Class;
		public static const MAPE01S01:String = "map_e01s01";
		[Embed(source="../../../../../sfx/xml/stages/e01s01.xml", mimeType="application/octet-stream")] private static var XMLE01S01Class:Class;
		public static const XMLE01S01:String = "xml_e01s01";
		
		[Embed(source="../../../../../sfx/sprites/stages/e01s02.png")] private static var MapE01S02Class:Class;
		public static const MAPE01S02:String = "map_e01s02";
		[Embed(source="../../../../../sfx/xml/stages/e01s02.xml", mimeType="application/octet-stream")] private static var XMLE01S02Class:Class;
		public static const XMLE01S02:String = "xml_e01s02";
		
		[Embed(source="../../../../../sfx/sprites/stages/e01s03.png")] private static var MapE01S03Class:Class;
		public static const MAPE01S03:String = "map_e01s03";
		[Embed(source="../../../../../sfx/xml/stages/e01s03.xml", mimeType="application/octet-stream")] private static var XMLE01S03Class:Class;
		public static const XMLE01S03:String = "xml_e01s03";
		
		
		[Embed(source="../../../../../sfx/sprites/stages/e02s01.png")] private static var MapE02S01Class:Class;
		public static const MAPE02S01:String = "map_e02s01";
		[Embed(source="../../../../../sfx/xml/stages/e02s01.xml", mimeType="application/octet-stream")] private static var XMLE02S01Class:Class;
		public static const XMLE02S01:String = "xml_e02s01";
		
		[Embed(source="../../../../../sfx/sprites/stages/e02s02.png")] private static var MapE02S02Class:Class;
		public static const MAPE02S02:String = "map_e02s02";
		[Embed(source="../../../../../sfx/xml/stages/e02s02.xml", mimeType="application/octet-stream")] private static var XMLE02S02Class:Class;
		public static const XMLE02S02:String = "xml_e02s02";
		
		[Embed(source="../../../../../sfx/sprites/stages/e02s03.png")] private static var MapE02S03Class:Class;
		public static const MAPE02S03:String = "map_e02s03";
		[Embed(source="../../../../../sfx/xml/stages/e02s03.xml", mimeType="application/octet-stream")] private static var XMLE02S03Class:Class;
		public static const XMLE02S03:String = "xml_e02s03";
		
		
		[Embed(source="../../../../../sfx/sprites/stages/e03s01.png")] private static var MapE03S01Class:Class;
		public static const MAPE03S01:String = "map_e03s01";
		[Embed(source="../../../../../sfx/xml/stages/e03s01.xml", mimeType="application/octet-stream")] private static var XMLE03S01Class:Class;
		public static const XMLE03S01:String = "xml_e03s01";
		
		[Embed(source="../../../../../sfx/sprites/stages/e03s02.png")] private static var MapE03S02Class:Class;
		public static const MAPE03S02:String = "map_e03s02";
		[Embed(source="../../../../../sfx/xml/stages/e03s02.xml", mimeType="application/octet-stream")] private static var XMLE03S02Class:Class;
		public static const XMLE03S02:String = "xml_e03s02";
		
		[Embed(source="../../../../../sfx/sprites/stages/e03s03.png")] private static var MapE03S03Class:Class;
		public static const MAPE03S03:String = "map_e03s03";
		[Embed(source="../../../../../sfx/xml/stages/e03s03.xml", mimeType="application/octet-stream")] private static var XMLE03S03Class:Class;
		public static const XMLE03S03:String = "xml_e03s03";
		
		/*** OTHERS ***/
		[Embed(source="../../../../../sfx/sprites/StageBackground.jpg")]
		private static var StageBackgroundClass:Class;
		public static const STAGE_BACKGROUND:String = "stage_background";
		
		[Embed(source="../../../../../sfx/sprites/tilemap.png")]
		private static var FloorClass:Class;
		public static const FLOOR_TILEMAP:String = "floor_tile";
		
		[Embed(source="../../../../../sfx/sprites/hero.jpg")]
		private static var PlayerClass:Class;
		public static const PLAYER:String = "player";
		
		[Embed(source="../../../../../sfx/sprites/enemy.jpg")]
		private static var EnemyClass:Class;
		public static const ENEMY:String = "enemy";
		
		[Embed(source="../../../../../sfx/sprites/misc/sign.png")]
		private static var SignClass:Class;
		public static const SIGN:String = "sign";
		
		
		/*** GUNS ***/
		[Embed(source="../../../../../sfx/sprites/guns/pistol_hud.jpg")]
		private static var PistolHUDClass:Class;
		public static const PISTOL_HUD:String = "pistol_hud";
		
		[Embed(source="../../../../../sfx/sprites/guns/revolver_hud.jpg")]
		private static var RevolverHUDClass:Class;
		public static const REVOLVER_HUD:String = "revolver_hud";
		
		[Embed(source="../../../../../sfx/sprites/guns/shotgun_hud.jpg")]
		private static var ShotgunHUDClass:Class;
		public static const SHOTGUN_HUD:String = "shotgun_hud";
		
		[Embed(source="../../../../../sfx/sprites/guns/rifle_hud.jpg")]
		private static var RifleHUDClass:Class;
		public static const RIFLE_HUD:String = "rifle_hud";
		
		/*** ITEMS ***/
		[Embed(source="../../../../../sfx/sprites/money.png")]
		private static var MoneyClass:Class;
		public static const MONEY:String = "money";
		
		[Embed(source="../../../../../sfx/sprites/gold.png")]
		private static var GoldClass:Class;
		public static const GOLD:String = "gold";
		
		[Embed(source="../../../../../sfx/sprites/barrel.png")]
		private static var BarrelClass:Class;
		public static const BARREL:String = "barrel";
		
		/*** BADGES ***/
		[Embed(source="../../../../../sfx/sprites/badges/badge_bandits.png")]
		public static var BadgeBanditsClass:Class;
		public static const BADGE_BANDITS:String = "badge_bandits";
		
		[Embed(source="../../../../../sfx/sprites/badges/badge_indians.png")]
		public static var BadgeIndiansClass:Class;
		public static const BADGE_INDIANS:String = "badge_indians";
		
		[Embed(source="../../../../../sfx/sprites/badges/badge_mexicans.png")]
		public static var BadgeMexicansClass:Class;
		public static const BADGE_MEXICANS:String = "badge_mexicans";
		
		[Embed(source="../../../../../sfx/sprites/badges/badge_pistol.png")]
		public static var BadgePistolClass:Class;
		public static const BADGE_PISTOL:String = "badge_pistol";
		
		[Embed(source="../../../../../sfx/sprites/badges/badge_revolver.png")]
		public static var BadgeRevolverClass:Class;
		public static const BADGE_REVOLVER:String = "badge_revolver";
		
		[Embed(source="../../../../../sfx/sprites/badges/badge_shotgun.png")]
		public static var BadgeShotgunClass:Class;
		public static const BADGE_SHOTGUN:String = "badge_shotgun";
		
		[Embed(source="../../../../../sfx/sprites/badges/badge_rifle.png")]
		public static var BadgeRifleClass:Class;
		public static const BADGE_RIFLE:String = "badge_rifle";
		
		[Embed(source="../../../../../sfx/sprites/badges/badge_rare_item.png")]
		public static var BadgeRareItemClass:Class;
		public static const BADGE_RARE_ITEM:String = "badge_rare_item";
		
		[Embed(source="../../../../../sfx/sprites/badges/badge_episode1.png")]
		public static var BadgeEpisode1Class:Class;
		public static const BADGE_EPISODE1:String = "badge_episode1";
		
		[Embed(source="../../../../../sfx/sprites/badges/badge_episode2.png")]
		public static var BadgeEpisode2Class:Class;
		public static const BADGE_EPISODE2:String = "badge_episode2";
		
		[Embed(source="../../../../../sfx/sprites/badges/badge_episode3.png")]
		public static var BadgeEpisode3Class:Class;
		public static const BADGE_EPISODE3:String = "badge_episode3";
		
		/*** MISC ***/
		[Embed(source="../../../../../sfx/sprites/misc/badge_message.png")] public static var BadgeMessageClass:Class;
		[Embed(source="../../../../../sfx/sprites/misc/no_buy.png")] public static var NoBuyClass:Class;
		[Embed(source="../../../../../sfx/sprites/misc/comingsoon.png")] public static var ComingSoonClass:Class;
		
		/*** STORE ***/
		[Embed(source="../../../../../sfx/sprites/store/store_revolver.jpg")] public static var StoreRevolver:Class;
		[Embed(source="../../../../../sfx/sprites/store/store_revolver_bullets.jpg")] public static var StoreRevolverBullets:Class;
		
		[Embed(source="../../../../../sfx/sprites/store/store_shotgun.jpg")] public static var StoreShotgun:Class;
		[Embed(source="../../../../../sfx/sprites/store/store_shotgun_shells.jpg")] public static var StoreShotgunShells:Class;
		
		[Embed(source="../../../../../sfx/sprites/store/store_rifle.jpg")] public static var StoreRifle:Class;
		[Embed(source="../../../../../sfx/sprites/store/store_rifle_bullets.jpg")] public static var StoreRifleBullets:Class;
		
		/*** SCENARY ***/
		[Embed(source="../../../../../sfx/sprites/scenary/cloud.png")]
		public static var CloudClass:Class;
		public static const CLOUD:String = "cloud";
		
		[Embed(source="../../../../../sfx/sprites/scenary/cloud2.png")]
		public static var Cloud2Class:Class;
		public static const CLOUD2:String = "cloud2";
		
		[Embed(source="../../../../../sfx/sprites/scenary/mountain1.png")]
		public static var Mountain1Class:Class;
		public static const MOUNTAIN1:String = "mountain1";
		
		[Embed(source="../../../../../sfx/sprites/scenary/mountain2.png")]
		public static var Mountain2Class:Class;
		public static const MOUNTAIN2:String = "mountain2";
		
		[Embed(source="../../../../../sfx/sprites/scenary/mountain3.png")]
		public static var Mountain3Class:Class;
		public static const MOUNTAIN3:String = "mountain3";
		
		[Embed(source="../../../../../sfx/sprites/scenary/mountain4.png")]
		public static var Mountain4Class:Class;
		public static const MOUNTAIN4:String = "mountain4";
		
		[Embed(source="../../../../../sfx/sprites/scenary/mountain5.png")]
		public static var Mountain5Class:Class;
		public static const MOUNTAIN5:String = "mountain5";
		
		[Embed(source="../../../../../sfx/sprites/scenary/fence.png")]
		public static var FenceClass:Class;
		public static const FENCE:String = "fence";
		
		[Embed(source="../../../../../sfx/sprites/scenary/sheriff_house.png")]
		public static var SheriffHouseClass:Class;
		public static const SHERIFF_HOUSE:String = "sheriff_house";
		
		[Embed(source="../../../../../sfx/sprites/scenary/barn.png")]
		public static var BarnClass:Class;
		public static const BARN:String = "barn";
		
		[Embed(source="../../../../../sfx/sprites/scenary/saloon.png")]
		public static var SaloonClass:Class;
		public static const SALOON:String = "saloon";
		
		[Embed(source="../../../../../sfx/sprites/scenary/wagon.png")]
		public static var WagonClass:Class;
		public static const WAGON:String = "wagon";
		
		[Embed(source="../../../../../sfx/sprites/scenary/cow.png")]
		public static var CowClass:Class;
		public static const COW:String = "cow";
		
		/*** SOUNDS ***/
		[Embed(source="../../../../../sfx/effects/pistol_shot.mp3")] public static var PistolShotClass:Class;
		public static var PISTOL_SOUND:String = "pistol_sound";
		
		[Embed(source="../../../../../sfx/effects/revolver_shot.mp3")] public static var RevolverShotClass:Class;
		public static var REVOLVER_SOUND:String = "revolver_sound";
		
		[Embed(source="../../../../../sfx/effects/shotgun_shot.mp3")] public static var ShotgunShotClass:Class;
		public static var SHOTGUN_SOUND:String = "shotgun_sound";
		
		[Embed(source="../../../../../sfx/effects/rifle_shot.mp3")] public static var RifleShotClass:Class;
		public static var RIFLE_SOUND:String = "rifle_sound";
		
		[Embed(source="../../../../../sfx/effects/dying.mp3")] public static var DyingClass:Class;
		public static var DYING_SOUND:String = "dying_sound";
		
		[Embed(source="../../../../../sfx/effects/crate.mp3")] public static var CrateClass:Class;
		public static var CRATE_SOUND:String = "crate_sound";
		
		[Embed(source="../../../../../sfx/effects/blood.mp3")] public static var BloodClass:Class;
		public static var BLOOD_SOUND:String = "blood_sound";
		
		[Embed(source="../../../../../sfx/effects/reload.mp3")] public static var ReloadClass:Class;
		
		[Embed(source="../../../../../sfx/music/outlaws.mp3")] public static var MusicClass:Class;
		
		
		
		public static function getClass(id:String):Class {
			switch(id){
				case FLOOR_TILEMAP:
					return FloorClass;
					
				case STAGE_BACKGROUND:
					return StageBackgroundClass;
					
				case PLAYER:
					return PlayerClass;
				
				case ENEMY:
					return EnemyClass;
				
				case SIGN:
					return SignClass;
				
				case PISTOL_HUD:
					return PistolHUDClass;
				case REVOLVER_HUD:
					return RevolverHUDClass;
				case SHOTGUN_HUD:
					return ShotgunHUDClass;
				case RIFLE_HUD:
					return RifleHUDClass;
					
				case PISTOL_SOUND:
					return PistolShotClass;
				case REVOLVER_SOUND:
					return RevolverShotClass;
				case SHOTGUN_SOUND:
					return ShotgunShotClass;
				case RIFLE_SOUND:
					return RifleShotClass;
				case DYING_SOUND:
					return DyingClass;
				case CRATE_SOUND:
					return CrateClass;
				case BLOOD_SOUND:
					return BloodClass;
				
				case MONEY:
					return MoneyClass;
				case GOLD:
					return GoldClass;
				case BARREL:
					return BarrelClass;
				
				case CLOUD:
					return CloudClass;
				case CLOUD2:
					return Cloud2Class;
				case MOUNTAIN1:
					return Mountain1Class;
				case MOUNTAIN2:
					return Mountain2Class;
				case MOUNTAIN3:
					return Mountain3Class;
				case MOUNTAIN4:
					return Mountain4Class;
				case MOUNTAIN5:
					return Mountain5Class;
				case FENCE:
					return FenceClass;
				case SHERIFF_HOUSE:
					return SheriffHouseClass;
				case BARN:
					return BarnClass;
				case SALOON:
					return SaloonClass;
				case WAGON:
					return WagonClass;
				case COW:
					return CowClass;
				
				case BADGE_BANDITS:
					return BadgeBanditsClass;
				case BADGE_INDIANS:
					return BadgeIndiansClass;
				case BADGE_MEXICANS:
					return BadgeMexicansClass;
				case BADGE_PISTOL:
					return BadgePistolClass;
				case BADGE_REVOLVER:
					return BadgeRevolverClass;
				case BADGE_SHOTGUN:
					return BadgeShotgunClass;
				case BADGE_RIFLE:
					return BadgeRifleClass;
				case BADGE_RARE_ITEM:
					return BadgeRareItemClass;
				case BADGE_EPISODE1:
					return BadgeEpisode1Class;
				case BADGE_EPISODE2:
					return BadgeEpisode2Class;
				case BADGE_EPISODE3:
					return BadgeEpisode3Class;
				
				case XMLDefault:
					return XMLDefaultClass;
				
				case MAPE01S01:
					return MapE01S01Class;
				case XMLE01S01:
					return XMLE01S01Class;
				
				case MAPE01S02:
					return MapE01S02Class;
				case XMLE01S02:
					return XMLE01S02Class;
				
				case MAPE01S03:
					return MapE01S03Class;
				case XMLE01S03:
					return XMLE01S03Class;
				
				case MAPE02S01:
					return MapE02S01Class;
				case XMLE02S01:
					return XMLE02S01Class;
				
				case MAPE02S02:
					return MapE02S02Class;
				case XMLE02S02:
					return XMLE02S02Class;
				
				case MAPE02S03:
					return MapE02S03Class;
				case XMLE02S03:
					return XMLE02S03Class;
				
				case MAPE03S01:
					return MapE03S01Class;
				case XMLE03S01:
					return XMLE03S01Class;
				
				case MAPE03S02:
					return MapE03S02Class;
				case XMLE03S02:
					return XMLE03S02Class;
				
				case MAPE03S03:
					return MapE03S03Class;
				case XMLE03S03:
					return XMLE03S03Class;
					
				default:
					cpln("Error: Class not found: " + id);
			}
			
			return null;
		}
	}
}