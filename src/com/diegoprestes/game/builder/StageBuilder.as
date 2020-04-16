package com.diegoprestes.game.builder {

	import org.flixel.FlxTilemap;
	import com.diegoprestes.game.assets.AssetLibrary;
	import com.diegoprestes.game.components.Component;
	import com.diegoprestes.game.components.IComponent;
	import com.diegoprestes.game.manager.MessageManager;
	import com.diegoprestes.game.GameObject;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.FlxEmitter;
	import org.flixel.FlxGroup;
	import org.flixel.FlxParticle;
	import org.flixel.FlxPoint;
	import org.flixel.FlxText;
	
	/**
	 * @author diegoprestes
	 */
	public class StageBuilder {
		
		public var messageManager:MessageManager;
		
		public var map:FlxTilemap;
		public var player:GameObject;
		
		public var objects:Object;
		
		public var groups:Object;
		
		public var stageData:Object;
		
		private var templates:Object;
		
		public static var INSTANCE:StageBuilder;
		
		private var itemCount:Number;
		
		public function StageBuilder(groups:Object, map:FlxTilemap) {
			INSTANCE = this;
			
			this.groups = groups;
			this.map = map;
			
			messageManager = new MessageManager();
			
			objects = {};
			templates = {};
		}
		
		public function destroy():void {
			INSTANCE = null;
		}

		public function build(XmlClass:Class):void {
			itemCount = 0;
			
			stageData = {};
			
			var defaultClass:Class = AssetLibrary.getClass(AssetLibrary.XMLDefault);
			var defaultData:String = new defaultClass().toString();
			var defaultXml:XML = new XML(defaultData);
			
			buildXml(defaultXml);
			
			var data:String = new XmlClass().toString();
			var stageXml:XML = new XML(data);
			
			buildXml(stageXml);
		}
		
		private function buildXml(xml:XML):void {
			if (xml.@episode != undefined) {
				stageData["episode"] = xml.@episode;
				stageData["stage"] = xml.@stage;
			}
			
			var templateList:XMLList = xml.templates.object;
			for each (var template:XML in templateList)
				templates[template.@id] = template;
			
			var objectList:XMLList = xml.objects.object;
			for each (var object:XML in objectList) {
				if (object.@id != "dummy")
					createObject(object);
			}
		}
		
		private function createObject(data:XML, isTemplate:Boolean = false):GameObject {
			cpln("Create Object = " + data.@id + " - " + isTemplate);
			
			var object:GameObject;
			if (data.@template != undefined && data.@template != "") {
				if (templates[data.@template] == null) {
					cpln("Error: Template not found " + data.@template);
					
					return null;
				} else {
					object = createObject(templates[data.@template], true);
					
					objects[data.@template] = null;
					objects[data.@id] = object;
				}
			} else {
				object = objects[data.@id];
				
				if (object == null) {
					object = new GameObject();
					
					objects[data.@id] = object;
				}
			}
			
			object.setValue("id", data.@id);
			
			if (data.@x != undefined) {
				object.x = data.@x;
				object.y = data.@y;
			}
			
			if (data.@group != undefined)
				object.setValue("group", data.@group);			
			
			if (data.@group == "player")
				player = object;
			
			var valuesList:XMLList = data.values.item;
			for each (var value:XML in valuesList)
				object.setValue(value.@id, value);
			
			var componentList:XMLList = data.components.component;
			for each (var comp:XML in componentList) {
				var component:Component = object.getComponentById(comp.@id);
				
				if (!component) {
					object.addComponent(comp.@id, comp.@type);
					
					component = object.getComponentById(comp.@id);
				}
				
				if (comp.@message == "true")
					messageManager.registerComponent(component as IComponent);
				
				var compValuesList:XMLList = comp.values.item;
				if (compValuesList.length()) {
					for each (var compValue:XML in compValuesList)
						component.setValue(compValue.@id, compValue);
				}
				
				cpln("CREATE COMP = " + data.@id + " - " + comp.@id);
				component.create(object);
			}
			
			if (!isTemplate) {
				if (groups[object.getString("group")] == undefined) {
					cpln("Error: Stage Builder: Group not found: " + object.getString("group"));
				} else {
					if (object.getString("group") == "hud")
						object.scrollFactor = new FlxPoint(0, 0);
					else if (object.getString("group") == "b1")
						object.scrollFactor = new FlxPoint(Main.INSTANCE.config.getNumber("background_far_scroll_x"), Main.INSTANCE.config.getNumber("background_far_scroll_y"));
					else if (object.getString("group") == "b2")
						object.scrollFactor = new FlxPoint(Main.INSTANCE.config.getNumber("background_close_scroll_x"), Main.INSTANCE.config.getNumber("background_close_scroll_y"));
					//else if (object.getString("group") == "f1")
					//	object.scrollFactor = new FlxPoint(Main.INSTANCE.config.getNumber("foreground_scroll_x"), Main.INSTANCE.config.getNumber("foreground_scroll_y"));
					
					cpln("ADDING ITEM = " + data.@id);
					FlxGroup(groups[object.getString("group")]).add(object);
				}
			}
			
			return object;
		}
		
		public function createWeapon(id:String, object:GameObject):FlxWeapon {
			var fireRate:Number = Main.INSTANCE.config.getNumber(id + "_fire_rate");
			
			var weapon:FlxWeapon = new FlxWeapon(id, object);
			weapon.setFireRate(fireRate);
			
			if (id == "pistol")
				weapon.makePixelBullet(5, 4, 2, 0xFFFF0000, 20, 20);
			else if (id == "revolver")
				weapon.makePixelBullet(5, 4, 2, 0xFF0000FF, 20, 20);
			else if (id == "shotgun")
				weapon.makePixelBullet(5, 4, 4, 0xFFFF0000, 20, 20);
			else if (id == "rifle")
				weapon.makePixelBullet(5, 8, 3, 0xFF00FF00, 20, 20);
			
			
			if (object.getString("group") == "player")
				FlxGroup(groups["bulletP"]).add(weapon.group);
			else if (object.getString("group") == "enemy")
				FlxGroup(groups["bulletE"]).add(weapon.group);
			
			return weapon;
		}
		
		public function createBloodParticle(object:GameObject):void {
			var emitter:FlxEmitter = new FlxEmitter(object.x + object.width/2, object.y + object.height/2, 10);
			emitter.setXSpeed(-20, 20);
			emitter.setYSpeed(-50, 20);
			emitter.gravity = 100;
			 
			for (var i:int = 0; i < emitter.maxSize; i++) {
				var particle:FlxParticle = new FlxParticle();
				particle.makeGraphic(4, 4, 0xFFDC143C);
				particle.visible = false;
				emitter.add(particle);
			}
			 
			FlxGroup(groups["particles"]).add(emitter);
			emitter.start(true, 1);
		}
		
		public function createHealthBar(x:Number, y:Number, min:Number, max:Number):FlxBar {
			var bar:FlxBar = new FlxBar(x, y, FlxBar.FILL_LEFT_TO_RIGHT, 100, 20, null, "", min, max, true, 0xFF000000, 0xFFFF1100);
			bar.scrollFactor = new FlxPoint(0, 0);
			
			FlxGroup(groups["hud"]).add(bar);
			
			return bar;
		}
		
		public function createText(x:Number, y:Number, width:Number, label:String, group:String):FlxText {
			var text:FlxText = new FlxText(x, y, width, label);
			
			if (group == "hud")
				text.scrollFactor = new FlxPoint(0, 0);
			
			if (groups[group] == undefined)
				cpln("Error: Stage Builder: Group not found: " + group);
			else
				FlxGroup(groups[group]).add(text);
			
			return text;
		}
		
		public function createItem(data:Object, owner:GameObject):void {
			var item:GameObject = new GameObject();
			item.x = owner.x;
			item.y = owner.y;
			
			item.setValue("id", "item_" + itemCount++);
			item.setValue("group", "item");
			
			objects[item.getString("id")] = item;
			
			for (var key:String in data)
				item.setValue(key, data[key]);
			
			var component:IComponent;
			
			component = item.addComponent("physics", "com.diegoprestes.game.components.PhysicsComponent");
			component.create(item);
			
			component = item.addComponent("graphic", "com.diegoprestes.game.components.GraphicComponent");
			component.create(item);
			
			component = item.addComponent("item", "com.diegoprestes.game.components.ItemComponent");
			component.create(item);
			
			FlxGroup(groups["item"]).add(item);
		}
	}
}