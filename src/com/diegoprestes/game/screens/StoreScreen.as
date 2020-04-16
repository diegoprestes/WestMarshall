package com.diegoprestes.game.screens {
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import com.diegoprestes.game.manager.SaveManager;
	import com.diegoprestes.game.assets.AssetLibrary;
	import com.diegoprestes.game.screens.GameScreen;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	import org.flixel.FlxText;

	/**
	 * @author diegoprestes
	 */
	public class StoreScreen extends GameScreen {
		
		private var moneyLabel:FlxText;
		private var moneyValue:FlxText;
		
		private var revolver:FlxExtendedSprite;
		private var shotgun:FlxExtendedSprite;
		private var rifle:FlxExtendedSprite;
		
		private var revolverAmmo:FlxExtendedSprite;
		private var shotgunAmmo:FlxExtendedSprite;
		private var rifleAmmo:FlxExtendedSprite;
		
		private var noRevolver:FlxSprite;
		private var noShotgun:FlxSprite;
		private var noRifle:FlxSprite;
		
		private var noRevolverAmmo:FlxSprite;
		private var noShotgunAmmo:FlxSprite;
		private var noRifleAmmo:FlxSprite;

		public function StoreScreen() {
			titleText = Main.INSTANCE.getLabel("store_title");
			
			Main.INSTANCE.track("store");
		}

		override protected function createItems():void {
			super.createItems();
			
			var gunsText:FlxText = new FlxText(74, 95, 100, Main.INSTANCE.getLabel("guns"));
			gunsText.setFormat(AssetLibrary.WESTERN_FONT, 40, 0x000000);
			add(gunsText);
			
			var ammoText:FlxText = new FlxText(74, 258, 100, Main.INSTANCE.getLabel("ammo"));
			ammoText.setFormat(AssetLibrary.WESTERN_FONT, 40, 0x000000);
			add(ammoText);
			
			
			// REVOLVER
			revolver = new FlxExtendedSprite(79, 142, AssetLibrary.StoreRevolver);
			revolver.mouseReleasedCallback = onItemClicked;
			add(revolver);
			
			var revolverText:FlxText = new FlxText(86, 238, 100, Main.INSTANCE.getLabel("revolver"));
			revolverText.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			add(revolverText);
			
			var revolverPrice:FlxText = new FlxText(211, 238, 60, "$" + Main.INSTANCE.config.getString("revolver_price"));
			revolverPrice.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			add(revolverPrice);
			
			noRevolver = new FlxSprite(119, 152, AssetLibrary.NoBuyClass);
			add(noRevolver);
			
			
			// SHOTGUN
			shotgun = new FlxExtendedSprite(309, 142, AssetLibrary.StoreShotgun);
			shotgun.mouseReleasedCallback = onItemClicked;
			add(shotgun);
			
			var shotgunText:FlxText = new FlxText(316, 238, 100, Main.INSTANCE.getLabel("shotgun"));
			shotgunText.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			add(shotgunText);
			
			var shotgunPrice:FlxText = new FlxText(432, 238, 60, "$" + Main.INSTANCE.config.getString("shotgun_price"));
			shotgunPrice.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			add(shotgunPrice);
			
			noShotgun = new FlxSprite(349, 152, AssetLibrary.NoBuyClass);
			add(noShotgun); 
			
			
			// RIFLE
			rifle = new FlxExtendedSprite(539, 142, AssetLibrary.StoreRifle);
			rifle.mouseReleasedCallback = onItemClicked;
			add(rifle);
			
			var rifleText:FlxText = new FlxText(546, 238, 100, Main.INSTANCE.getLabel("rifle"));
			rifleText.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			add(rifleText);
			
			var riflePrice:FlxText = new FlxText(661, 238, 60, "$" + Main.INSTANCE.config.getString("rifle_price"));
			riflePrice.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			add(riflePrice);
			
			noRifle = new FlxSprite(579, 152, AssetLibrary.NoBuyClass);
			add(noRifle);
			
			
			// REVOLVER BULLETS
			revolverAmmo = new FlxExtendedSprite(79, 305, AssetLibrary.StoreRevolverBullets);
			revolverAmmo.mouseReleasedCallback = onItemClicked;
			add(revolverAmmo);
			
			var revolverAmmoText:FlxText = new FlxText(86, 401, 100, Main.INSTANCE.getLabel("bullets"));
			revolverAmmoText.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			add(revolverAmmoText);
			
			var revolverAmmoPrice:FlxText = new FlxText(224, 401, 60, "$" + Main.INSTANCE.config.getString("revolver_ammo_price"));
			revolverAmmoPrice.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			add(revolverAmmoPrice);
			
			noRevolverAmmo = new FlxSprite(119, 315, AssetLibrary.NoBuyClass);
			add(noRevolverAmmo);
			
			
			// SHOTGUN SHELLS
			shotgunAmmo = new FlxExtendedSprite(309, 305, AssetLibrary.StoreShotgunShells);
			shotgunAmmo.mouseReleasedCallback = onItemClicked;
			add(shotgunAmmo);
			
			var shotgunAmmoText:FlxText = new FlxText(316, 401, 100, Main.INSTANCE.getLabel("shells"));
			shotgunAmmoText.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			add(shotgunAmmoText);
			
			var shotgunAmmoPrice:FlxText = new FlxText(444, 401, 60, "$" + Main.INSTANCE.config.getString("shotgun_ammo_price"));
			shotgunAmmoPrice.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			add(shotgunAmmoPrice);
			
			noShotgunAmmo = new FlxSprite(349, 315, AssetLibrary.NoBuyClass);
			add(noShotgunAmmo);
			
			
			// RIFLE BULLETS
			rifleAmmo = new FlxExtendedSprite(539, 305, AssetLibrary.StoreRifleBullets);
			rifleAmmo.mouseReleasedCallback = onItemClicked;
			add(rifleAmmo);
			
			var rifleAmmoText:FlxText = new FlxText(546, 401, 100, Main.INSTANCE.getLabel("bullets"));
			rifleAmmoText.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			add(rifleAmmoText);
			
			var rifleAmmoPrice:FlxText = new FlxText(676, 401, 60, "$" + Main.INSTANCE.config.getString("rifle_ammo_price"));
			rifleAmmoPrice.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			add(rifleAmmoPrice);
			
			noRifleAmmo = new FlxSprite(579, 315, AssetLibrary.NoBuyClass);
			add(noRifleAmmo);
			
			
			// MONEY
			
			moneyLabel = new FlxText(663, 564, 100, Main.INSTANCE.getLabel("money"));
			moneyLabel.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			moneyLabel.x = 716 - moneyLabel.realWidth;
			add(moneyLabel);
			
			moneyValue = new FlxText(723, 564, 100, "$" + SaveManager.getInstance().getMoney());
			moneyValue.setFormat(AssetLibrary.WESTERN_FONT, 20, 0x000000);
			add(moneyValue);
			
			updateBuyItems();
		}
		
		private function updateBuyItems():void {
			var money:Number = SaveManager.getInstance().getMoney();
			
			var revolverPrice:Number = Main.INSTANCE.config.getNumber("revolver_price");
			if (money >= revolverPrice) {
				revolver.enableMouseClicks(true);
				noRevolver.visible = false;
			} else {
				revolver.disableMouseClicks();
				noRevolver.visible = true;
			}
			
			var shotgunPrice:Number = Main.INSTANCE.config.getNumber("shotgun_price");
			if (money >= shotgunPrice) {
				shotgun.enableMouseClicks(true);
				noShotgun.visible = false;
			} else {
				shotgun.disableMouseClicks();
				noShotgun.visible = true;
			}
			
			var riflePrice:Number = Main.INSTANCE.config.getNumber("rifle_price");
			if (money >= riflePrice) {
				rifle.enableMouseClicks(true);
				noRifle.visible = false;
			} else {
				rifle.disableMouseClicks();
				noRifle.visible = true;
			}
			
			var revolverAmmoPrice:Number = Main.INSTANCE.config.getNumber("revolver_ammo_price");
			if (money >= revolverAmmoPrice) {
				revolverAmmo.enableMouseClicks(true);
				noRevolverAmmo.visible = false;
			} else {
				revolverAmmo.disableMouseClicks();
				noRevolverAmmo.visible = true;
			}
			
			var shotgunAmmoPrice:Number = Main.INSTANCE.config.getNumber("shotgun_ammo_price");
			if (money >= shotgunAmmoPrice) {
				shotgunAmmo.enableMouseClicks(true);
				noShotgunAmmo.visible = false;
			} else {
				shotgunAmmo.disableMouseClicks();
				noShotgunAmmo.visible = true;
			}
			
			var rifleAmmoPrice:Number = Main.INSTANCE.config.getNumber("rifle_ammo_price");
			if (money >= rifleAmmoPrice) {
				rifleAmmo.enableMouseClicks(true);
				noRifleAmmo.visible = false;
			} else {
				rifleAmmo.disableMouseClicks();
				noRifleAmmo.visible = true;
			}
			
			moneyValue.text = "$" + money;
		}

		private function onItemClicked(target:FlxExtendedSprite, mouseX:int, mouseY:int):void {
			var money:Number = SaveManager.getInstance().getMoney();
			
			if (target == revolver) {
				money -= Main.INSTANCE.config.getNumber("revolver_price");
				
				SaveManager.getInstance().setWeaponEnabled("revolver", "true");
				
				SaveManager.getInstance().setWeaponBullets("revolver", Main.INSTANCE.config.getNumber("revolver_limit"));
				
				Main.INSTANCE.track("store/revolver");
			} else if (target == revolverAmmo) {
				money -= Main.INSTANCE.config.getNumber("revolver_ammo_price");
				
				SaveManager.getInstance().setWeaponBullets("revolver", Main.INSTANCE.config.getNumber("revolver_limit"));
				
				Main.INSTANCE.track("store/revolver_ammo");
			} else if (target == shotgun) {
				money -= Main.INSTANCE.config.getNumber("shotgun_price");
				
				SaveManager.getInstance().setWeaponEnabled("shotgun", "true");
				
				SaveManager.getInstance().setWeaponBullets("shotgun", Main.INSTANCE.config.getNumber("shotgun_limit"));
				
				Main.INSTANCE.track("store/shotgun");
			} else if (target == shotgunAmmo) {
				money -= Main.INSTANCE.config.getNumber("shotgun_ammo_price");
				
				SaveManager.getInstance().setWeaponBullets("shotgun", Main.INSTANCE.config.getNumber("shotgun_limit"));
				
				Main.INSTANCE.track("store/shotgun_ammo");
			} else if (target == rifle) {
				money -= Main.INSTANCE.config.getNumber("rifle_price");
				
				SaveManager.getInstance().setWeaponEnabled("rifle", "true");
				
				SaveManager.getInstance().setWeaponBullets("rifle", Main.INSTANCE.config.getNumber("rifle_limit"));
				
				Main.INSTANCE.track("store/rifle");
			} else if (target == rifleAmmo) {
				money -= Main.INSTANCE.config.getNumber("rifle_ammo_price");
				
				SaveManager.getInstance().setWeaponBullets("rifle", Main.INSTANCE.config.getNumber("rifle_limit"));
				
				Main.INSTANCE.track("store/rifle_ammo");
			}
			
			FlxG.play(AssetLibrary.ReloadClass);
			
			SaveManager.getInstance().setMoney(money);
			
			updateBuyItems();
		}

		override protected function onBackClicked():void {
			Main.INSTANCE.changeState(new StartScreen());
		}
	}
}