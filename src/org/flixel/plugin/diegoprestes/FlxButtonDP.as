package org.flixel.plugin.diegoprestes {
	import flash.text.TextFormat;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;

	/**
	 * @author Diego
	 */
	public class FlxButtonDP extends FlxButtonPlus {
		
		public function FlxButtonDP(X:int, Y:int, Callback:Function, Params:Array = null, Label:String = null, Width:int = 100, Height:int = 20, format:TextFormat = null) {
			super(X, Y, Callback, Params, Label, Width, Height);
			
			if (format) {
				textNormal.setFormat(format.font, Number(format.size), Number(format.color), format.align);
				
				textHighlight.setFormat(format.font, Number(format.size), Number(format.color), format.align);
			}
			
			updateInactiveButtonColors([0xFFCCCCCC, 0xFFCCCCCC]);
			updateActiveButtonColors([0xFF999999, 0xFF999999]);
			
			setTextOffset(0, -3);
			
			textHighlight.visible = false;
		}
		
		public function setTextOffset(offX:Number, offY:Number):void {
			textNormal.x += offX;
			textNormal.y += offY;
			
			textHighlight.x += offX;
			textHighlight.y += offY;
		}
	}
}
