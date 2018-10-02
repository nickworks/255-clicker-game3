package code {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Snow extends MovieClip {
		
		private var speed:Number;
		private var velocityX:Number;
		private var velocityY:Number;
		
		/** If this is true, the object is queued up to be destroyed!! */
		public var isDead:Boolean = false;
		
		public var radius:Number = 51;
		
		/** The amount of time (in seconds) to wait before spawning the next bullet. */
		private var spawnDelay:Number = 0;
		
		public function Snow() {
			x = Math.random() * 550;
			y = - 50;
			speed = Math.random() * 75 + 50; // 2 to 5?
			scaleX = Math.random() * .2 + .1; // .1 to .3
			scaleY = scaleX;
			radius *= scaleX;
			
			//addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
		public function update(game:Game):void {
			
			
			if(spawnDelay > 0){
				spawnDelay -= Time.dtScaled;
			} else {
				game.spawnBullet(this);
				spawnDelay = Math.random() * 1.5 + .5;
			}
			
			var dx:Number = game.player.x - x;
			var dy:Number = game.player.y - y;			
			var angleToPlayer:Number = Math.atan2(dy, dx);
			
			velocityY = speed * Math.sin(angleToPlayer);
			velocityX = speed * Math.cos(angleToPlayer);
			
			
			// fall
			x += velocityX * Time.dtScaled;
			y += velocityY * Time.dtScaled;
			if(y > 400){
				isDead = true;
			}
		}
		private function handleClick(e:MouseEvent):void {
			isDead = true;
		}
		/**
		 * This function's job is to prepare the object for removal.
		 * In this case, we need to remove any event-listeners on this object.
		 */
		public function dispose():void {
			//removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
	}
	
}
