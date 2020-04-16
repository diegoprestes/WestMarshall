package com.diegoprestes.game.screens.stage {
	import com.diegoprestes.game.assets.AssetLibrary;
	import com.diegoprestes.game.builder.StageBuilder;
	import com.diegoprestes.game.screens.StartScreen;
	import com.diegoprestes.game.GameObject;
	import com.diegoprestes.game.GameObjectVars;
	import flash.display.BitmapData;
	import org.flixel.plugin.photonstorm.BaseTypes.Bullet;
	import org.flixel.FlxCamera;
	import org.flixel.FlxGroup;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;

	/**
	 * @author diegoprestes
	 */
	public class StageScreen extends FlxState {
		
		private var stageId:String;
		
		private var tilemap:FlxTilemap;
		
		private var player:GameObject;
		
		private var backgroundFar:FlxGroup;
		private var backgroundClose:FlxGroup;
		private var backgroundNormal:FlxGroup;
		private var map:FlxGroup;
		private var players:FlxGroup;
		private var items:FlxGroup;
		private var itemsBreakable:FlxGroup;
		private var enemies:FlxGroup;
		private var bulletsP:FlxGroup;
		private var bulletsE:FlxGroup;
		private var particles:FlxGroup;
		private var foreground:FlxGroup;
		private var hud:FlxGroup;
		
		private var builder:StageBuilder;
		
		private var music:FlxSound;
		
		public function StageScreen(id:String) {
			stageId = id;
			
			cpln("STAGE ID = " + stageId);
		}

		override public function create():void {
			super.create();
			
			var background:FlxSprite = new FlxSprite(0, 0, AssetLibrary.getClass(AssetLibrary.STAGE_BACKGROUND));
			background.scrollFactor = new FlxPoint(0, 0); 
			add(background);

			
			createGroups();

			var tileSize:Number = Main.INSTANCE.config.getNumber("tile_size");
			var pixels:BitmapData = new FlxSprite(0, 0, AssetLibrary.getClass("map_" + stageId)).pixels;
			var worldString:String = FlxTilemap.bitmapToCSV(pixels, false, 1, TILES);
			tilemap = new FlxTilemap();
			tilemap.loadMap(worldString, AssetLibrary.getClass(AssetLibrary.FLOOR_TILEMAP), tileSize, tileSize, FlxTilemap.OFF, 0, 1, 1);
			map.add(tilemap);
			
			
			var groups:Object = {};
			groups["b1"] = backgroundFar;
			groups["b2"] = backgroundClose;
			groups["bg"] = backgroundNormal;
			groups["item"] = items;
			groups["breakable"] = itemsBreakable;
			groups["player"] = players;
			groups["enemy"] = enemies;
			groups["bulletP"] = bulletsP;
			groups["bulletE"] = bulletsE;
			groups["particles"] = particles;
			groups["f1"] = foreground;
			groups["hud"] = hud;
			builder = new StageBuilder(groups, tilemap);
			builder.build(AssetLibrary.getClass("xml_" + stageId));
			
			player = players.getFirstAlive() as GameObject;
			
			if (player) {
				// Adjust camera options
				FlxG.camera.follow(player, FlxCamera.STYLE_PLATFORMER);
				FlxG.camera.setBounds(0, 0, tilemap.width, tilemap.height);
				
				//FlxG.worldBounds.width = FlxG.width;
				//FlxG.worldBounds.height = FlxG.height;

				FlxG.worldBounds.width = tilemap.width;
				FlxG.worldBounds.height = tilemap.height;
			}
			
			music = new FlxSound();
			music.loadEmbedded(AssetLibrary.MusicClass, true);
			music.volume = 0.6;
			music.play(true);
		}
		
		private function createGroups():void {
			backgroundFar = new FlxGroup();
			add(backgroundFar);
			
			backgroundClose = new FlxGroup();
			add(backgroundClose);
			
			backgroundNormal = new FlxGroup();
			add(backgroundNormal);
			
			map = new FlxGroup(1);
			add(map);
			
			items = new FlxGroup();
			add(items);
			
			itemsBreakable = new FlxGroup();
			add(itemsBreakable);
			
			bulletsP = new FlxGroup();
			add(bulletsP);
			
			bulletsE = new FlxGroup();
			add(bulletsE);
			
			enemies = new FlxGroup();
			add(enemies);
			
			players = new FlxGroup(1);
			add(players);
			
			particles = new FlxGroup();
			add(particles);
			
			foreground = new FlxGroup();
			add(foreground);
			
			hud = new FlxGroup();
			add(hud);
		}

		override public function update():void {
			//FlxG.worldBounds.y = FlxG.camera.scroll.y;
			//FlxG.worldBounds.x = FlxG.camera.scroll.x;
			
			super.update();
			
			FlxG.collide(players, tilemap);
			FlxG.collide(enemies, tilemap);
			
			FlxG.collide(players, itemsBreakable);
			
			FlxG.collide(bulletsP, tilemap, onBulletHitWall);
			FlxG.collide(bulletsE, tilemap, onBulletHitWall);
			
			FlxG.collide(particles, tilemap);
			
			FlxG.collide(items, tilemap);
			FlxG.collide(itemsBreakable, tilemap);
			
			FlxG.collide(itemsBreakable, itemsBreakable);
			
			FlxG.overlap(enemies, bulletsP, onBulletHit);
			FlxG.overlap(players, bulletsE, onBulletHit);
			FlxG.overlap(itemsBreakable, bulletsP, onBulletHit);
			
			FlxG.overlap(players, items, onOverlap);
			
			if (FlxG.keys.ESCAPE) {
				Main.INSTANCE.changeState(new StartScreen());
			}
		}
		
		private function onBulletHitWall(bullet:Bullet, map:FlxTilemap):void {
			bullet.kill();
		}

		private function onBulletHit(object:GameObject, bullet:Bullet):void {
			object.sendMessage(GameObjectVars.OVERLAP, bullet);
		}
		
		private function onOverlap(object1:GameObject, object2:GameObject):void {
			object1.sendMessage(GameObjectVars.OVERLAP, object2);
			object2.sendMessage(GameObjectVars.OVERLAP, object1);
		}

		private static const TILES:Array = [
			0xFFFFFF, 0xCC9900, 0xCCCC00, 0x663300, 0xCCFF00,
			0xFFFFFF, 0xFFFFFF, 0x3366FF, 0x3300FF, 0x33CCFF,
			0xFFFFFF, 0xFFFFFF, 0xCC0000, 0xCC3300, 0xCC6600
		];

		override public function destroy():void {
			super.destroy();
			
			builder.destroy();
			
			music.stop();
		}
	}
}