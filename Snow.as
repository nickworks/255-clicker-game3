package  {
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Snow extends MovieClip {
		
		private var speed:Number;
		/** If this is true, the object is queued up to be destroyed!! */
		public var isDead:Boolean = false;
		
		public var radius:Number = 51;
		
		public function Snow() {
			x = Math.random() * 550;
			y = - 50;
			speed = Math.random() * 3 + 2; // 2 to 5?
			scaleX = Math.random() * .2 + .1; // .1 to .3
			scaleY = scaleX;
			radius *= scaleX;
			
			addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
		public function update():void {
			// fall
			y += speed;
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
			removeEventListener(MouseEvent.MOUSE_DOWN, handleClick);
		}
	}
	
}
