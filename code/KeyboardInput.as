package code {
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	
	public class KeyboardInput {

		static public var keyLeft:Boolean = false;
		static public var keyUp:Boolean = false;
		static public var keyRight:Boolean = false;
		static public var keyDown:Boolean = false;
		static public var keyEnter:Boolean = false;
		
		static public function setup(stage:Stage) {
			stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
		}
		static private function updateKey(keyCode:int, isDown:Boolean):void {
			
			if(keyCode == 13) keyEnter = isDown;
			if(keyCode == 37) keyLeft = isDown;
			if(keyCode == 38) keyUp = isDown;
			if(keyCode == 39) keyRight = isDown;
			if(keyCode == 40) keyDown = isDown;
		}
		static private function handleKeyDown(e:KeyboardEvent):void {
			//trace(e.keyCode);
			updateKey(e.keyCode, true);
		}
		static private function handleKeyUp(e:KeyboardEvent):void {
			
			updateKey(e.keyCode, false);
		}
		

	}
	
}
