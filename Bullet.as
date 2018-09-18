package  {
	
	import flash.display.MovieClip;
	
	
	public class Bullet extends MovieClip {

		private const SPEED:Number = 10;
		
		private var velocityX:Number = 0;
		private var velocityY:Number = -10;
		
		public var isDead:Boolean = false;
		public var radius:Number = 10;
		
		//var velocity:Point = new Point();
		
		public function Bullet(p:Player) {
			x = p.x;
			y = p.y;
			
			var angle:Number = (p.rotation - 90) * Math.PI / 180;
			
			velocityX = SPEED * Math.cos(angle);
			velocityY = SPEED * Math.sin(angle);
			
		}
		
		public function update():void {
			
			x += velocityX;
			y += velocityY;
			
			if(!stage || y < 0 || x < 0 || x > stage.stageWidth || y > stage.stageHeight) isDead = true;
		}
		
	} // ends class
} // ends package
