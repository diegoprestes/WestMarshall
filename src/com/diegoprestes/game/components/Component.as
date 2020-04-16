package com.diegoprestes.game.components {

	import com.diegoprestes.game.GameObject;
	
	/**
	 * @author diegoprestes
	 */
	public class Component {
		
		public static const ID:String = "id";
		
		private var values:Object;
		
		protected var owner:GameObject;
		
		public function Component() {
			values = {};
		}
		
		public function getId():String {
			return getString(ID);
		}
		
		public function create(owner:GameObject):void {
			this.owner = owner;
		}
		
		public function destroy():void {
			
		}
		
		public function onGlobalMessage(id:String, target:String, message:Object):void {
		}
		
		public function getValues():Array {
			var list:Array = [];
			
			for (var i:String in values)
				list.push([i, values[i]]);
			
			return list;
		}
		
		public function setValue(id:String, value:Object):void {
			values[id] = value;
		}
		
		public function getValue(id:String):Object {
			if (values[id] == null)
				cpln("Value with id " + id + " not found");
			
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
	}
}