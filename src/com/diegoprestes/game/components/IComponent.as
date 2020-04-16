package com.diegoprestes.game.components {

	import com.diegoprestes.game.GameObject;
	
	/**
	 * @author diegoprestes
	 */
	public interface IComponent {
		function create(owner:GameObject):void;
		
		function onUpdate():void;
		
		function onMessage(id:String, value:Object = null):void;
		
		function setValue(id:String, value:Object):void;
		
		function onGlobalMessage(id:String, target:String, message:Object):void;
	}
}