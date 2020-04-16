package {
	import org.flixel.system.FlxPreloader;

	/**
	 * @author Diego
	 */
	public class Preloader extends FlxPreloader {
		
		public function Preloader() {
			className = "Main";
			super();
		}

		override protected function create():void {
			super.create();
		}

		override protected function update(Percent:Number):void {
			super.update(Percent);
		}
	}
}