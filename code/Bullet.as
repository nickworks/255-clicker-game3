package code {
	
	import flash.display.MovieClip;
	
	
	public class Bullet extends MovieClip {
		
		private const SPEED:Number = 240;
		
		private var velocityX:Number = 0;
		/** The y-velocity in px/s. */
		private var velocityY:Number = 0;
		
		public var isDead:Boolean = false;
		public var radius:Number = 10;
		
		//var velocity:Point = new Point();
		
		public function Bullet(p:Player, s:Snow = null) {
			
			
			if(s){ // enemy bullet:
				x = s.x;
				y = s.y;
				
					
				var tx:Number = p.x - s.x;
				var ty:Number = p.y - s.y;
				
				var angle:Number = Math.atan2(ty, tx);
				angle += (Math.random() * 20 + Math.random() * -20) * Math.PI / 180;
				
				velocityX = SPEED * Math.cos(angle);
				velocityY = SPEED * Math.sin(angle);
				
				
			} else { // player bullet:
				x = p.x;
				y = p.y;
				
				var angle:Number = (p.rotation - 90) * Math.PI / 180;
				
				velocityX = SPEED * Math.cos(angle);
				velocityY = SPEED * Math.sin(angle);
			}
			
		}
		
		public function update():void {
			
			x += velocityX * Time.dtScaled;
			y += velocityY * Time.dtScaled;
			
			if(!stage || y < 0 || x < 0 || x > stage.stageWidth || y > stage.stageHeight) isDead = true;
		}
		
	} // ends class
} // ends package
