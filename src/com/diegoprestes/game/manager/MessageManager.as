package com.diegoprestes.game.manager {
	import com.diegoprestes.game.components.IComponent;

	/**
	 * @author diegoprestes
	 */
	public class MessageManager {
		
		private var list:Array;
		
		public function MessageManager() {
			list = [];
		}
		
		public function registerComponent(component:IComponent):void {
			list.push(component);
		}
		
		/**
		 *  sends global messages to components that wants to receive messages between game objects
		 *  @param id: id of the message
		 *  @param target: the id of the game object that matters for this message
		 *  @param message: the message
		 */
		public function sendGlobalMessage(id:String, target:String, message:Object):void {
			for (var i:int = 0; i < list.length; i++) {
				IComponent(list[i]).onGlobalMessage(id, target, message);
			}
		}
	}
}