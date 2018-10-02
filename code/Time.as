package code {
	import flash.utils.getTimer;
	
	public class Time {

		public static var dt:Number = 0;
		public static var dtScaled:Number = 0;
		public static var time:Number = 0;

		public static var scale:Number = 1;
		
		private static var timePrev:Number = 0;
		
		
		
		public static function update():void {
			time = getTimer();
			dt = (time - timePrev) / 1000;
			dtScaled = dt * scale;
			timePrev = time; // cache for next frame
		}
	}
}
