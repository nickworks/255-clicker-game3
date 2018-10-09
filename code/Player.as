package code {
	
	import flash.display.MovieClip;
	
	
	public class Player extends MovieClip {
		
		var health:int = 4;
		var radius:Number = 17;
		
		public function Player() {
			// constructor code
		}
		
		public function update():void {
			
			var speed:Number = 200;

			if(KeyboardInput.keyLeft) x -= speed * Time.dtScaled;
			if(KeyboardInput.keyRight) x += speed * Time.dtScaled;
			if(KeyboardInput.keyUp) y -= speed * Time.dtScaled;
			if(KeyboardInput.keyDown) y += speed * Time.dtScaled;
			
			
			var tx:Number = parent.mouseX - x;
			var ty:Number = parent.mouseY - y;
			var angle:Number = Math.atan2(ty, tx);
			angle *= 180 / Math.PI;
			
			rotation = angle + 90;
			// rotate player sprite
		}
	}
	
}
