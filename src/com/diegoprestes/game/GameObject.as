package com.diegoprestes.game {
	import com.diegoprestes.game.components.Component;
	import com.diegoprestes.game.components.IComponent;
	import flash.utils.getDefinitionByName;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;

	/**
	 * @author diegoprestes
	 */
	public class GameObject extends FlxExtendedSprite {
		
		private var values:Object;
		
		private var components:Array;
		
		public function GameObject() {
			super();
			
			values = {};
			
			components = [];
		}
		
		override public function update():void {
			super.update();
			
			for (var i:Number = 0; i < components.length; i++) {
				IComponent(components[i]).onUpdate();
			}
		}
		
		public function setValue(id:String, value:Object):void {
			values[id] = value;
		}
		
		public function hasValue(id:String):Boolean {
			return values[id] != undefined;
		}
		
		public function getValue(id:String):Object {
			if (values[id] == null)
				cpln("Value with id  " + id + "  not found");
			
			return values[id];
		}
		
		public function getString(id:String):String {
			return String(getValue(id));
		}
		
		public function getNumber(id:String):Number {
			return Number(getValue(id));
		}
		
		public function getBoolean(id:String):Boolean {
			return getString(id) == "true" ? true : false;
		}
		
		public function addComponent(id:String, type:String):IComponent {
			var ComponentClass:Class = getDefinitionByName(type) as Class;
			var component:IComponent = new ComponentClass();
			component.setValue("id", id);
			components.push(component);
			
			return component;
		}
		
		public function removeComponent(id:String):void {
			for (var i:Number = components.length - 1; i >= 0; i--) {
				if (Component(components[i]).getId() == id) {
					Component(components[i]).destroy();
					
					components.splice(i, 1);
				}
			}
		}
		
		public function getComponentById(id:String):Component {
			for (var i:Number = 0; i < components.length; i++)
				if (Component(components[i]).getId() == id)
					return components[i];
			
			return null;
		}
		
		public function sendMessage(id:String, value:Object = null):void {
			for (var i:Number = 0; i < components.length; i++) {
				IComponent(components[i]).onMessage(id, value);
			}
		}
		
		override public function toString():String {
			return "GO: " + getString("id");
		}
	}
}