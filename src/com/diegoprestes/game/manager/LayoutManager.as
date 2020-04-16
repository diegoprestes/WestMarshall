package com.diegoprestes.game.manager {

	import com.diegoprestes.game.assets.AssetLibrary;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * @author diegoprestes
	 */
	public class LayoutManager {

		public static function createStartScreenFormat():TextFormat {
			var format:TextFormat = new TextFormat();
			format.size = 24;
			format.font = AssetLibrary.WESTERN_FONT;
			format.color = 0x000000;
			
			return format;
		}
		
		public static function createBackButtonFormat():TextFormat {
			var format:TextFormat = new TextFormat();
			format.size = 22;
			format.font = AssetLibrary.WESTERN_FONT;
			format.color = 0x000000;
			
			return format;
		}
		
		public static function createInsideScreenTitleFormat():TextFormat {
			var format:TextFormat = new TextFormat();
			format.size = 50;
			format.font = AssetLibrary.ANDERSON_THUNDERBIRDS_FONT;
			format.color = 0x000000;
			format.align = TextFormatAlign.CENTER;
			
			return format;
		}
		
		public static function createEpisodeTitleFormat():TextFormat {
			var format:TextFormat = LayoutManager.createInsideScreenTitleFormat();
			format.size = 40;
			
			return format;
		}
		
		public static function createStageTitleFormat():TextFormat {
			var format:TextFormat = LayoutManager.createInsideScreenTitleFormat();
			format.size = 30;
			
			return format;
		}
		
		public static function createEpisodeButtonFormat():TextFormat {
			var format:TextFormat = new TextFormat();
			format.size = 50;
			format.font = AssetLibrary.WESTERN_FONT;
			format.color = 0x000000;
			
			return format;
		}
		
		public static function createStageButtonFormat():TextFormat {
			var format:TextFormat = new TextFormat();
			format.size = 40;
			format.font = AssetLibrary.WESTERN_FONT;
			format.color = 0x000000;
			
			return format;
		}
		
		public static function createStageDescFormat():TextFormat {
			var format:TextFormat = new TextFormat();
			format.size = 18;
			format.font = AssetLibrary.WESTERN_FONT;
			format.color = 0x000000;
			
			return format;
		}
	}
}