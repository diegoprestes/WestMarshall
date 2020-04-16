package com.diegoprestes.game.manager {

	/**
	 * @author diegoprestes
	 */
	public class DictionaryManager {
		
		private var data:Object;
		
		public function DictionaryManager(Source:Class) {
			data = {};
			
			var content:String = new Source().toString();
			var xml:XML = new XML(content);
			var items:XMLList = xml.item;
			
			for each (var item:XML in items) {
				data[item.@id] = item;
			}
		}
		
		public function getValue(id:String):Object {
			if (data[id])
				return data[id];
			
			cpln("Data with id = " + id + " not found.");
			
			return null;
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