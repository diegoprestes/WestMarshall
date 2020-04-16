package com.diegoprestes.game.components {
	import org.flixel.FlxObject;
	import com.diegoprestes.game.assets.AssetLibrary;
	import com.diegoprestes.game.GameObject;
	
	

	/**
	 * @author diegoprestes
	 */
	public class GraphicComponent extends Component implements IComponent {
		public function GraphicComponent() {
			super();
		}
		
		override public function create(owner:GameObject):void {
			super.create(owner);
			
			owner.loadGraphic(AssetLibrary.getClass(owner.getString("graphic")), false, true);
			
			var facing:uint = FlxObject.RIGHT;
			if (owner.hasValue("facing"))
				facing = owner.getString("facing") == "right" ? FlxObject.RIGHT : FlxObject.LEFT;
			
			owner.facing = facing;
		}
		
		public function onUpdate():void {
		}
		
		public function onMessage(id:String, value:Object = null):void {
		}
	}
}