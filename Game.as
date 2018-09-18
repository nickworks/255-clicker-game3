package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * This is the controller class for the entire Game.
	 */
	public class Game extends MovieClip {
		
		/** This array should only hold Snow objects. */
		var snowflakes:Array = new Array();
		/** The number frames to wait before spawning the next Snow object. */
		var delaySpawn:int = 0;
		
		/** This array holds only Bullet objects. */
		var bullets:Array = new Array();
		
		/**
		 * This is where we setup the game.
		 */
		public function Game() {
			
			addEventListener(Event.ENTER_FRAME, gameLoop);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, handleClick);
			
		}
		/**
		 * This event-handler is called every time a new frame is drawn.
		 * It's our game loop!
		 * @param e The Event that triggered this event-handler.
		 */
		private function gameLoop(e:Event):void {
			
			spawnSnow();
			
			player.update();
			
			updateSnow();
			
			updateBullets();
			
			collisionDetection();
			
		} // function gameLoop
		
		private function handleClick(e:MouseEvent):void {
			spawnBullet();
		}
		
		private function spawnBullet():void {

			var b:Bullet = new Bullet(player);
			addChild(b);
			bullets.push(b);
		}
		
		/**
		 * Decrements the countdown timer, when it hits 0, it spawns a snowflake.
		 */
		private function spawnSnow():void{
			// spawn snow:
			delaySpawn --;
			if(delaySpawn <= 0){
				var s:Snow = new Snow();
				addChild(s);
				snowflakes.push(s);
				delaySpawn = (int)(Math.random() * 10 + 10);
			}
		}
		
		private function updateSnow():void{
			// update everything:
			for(var i = snowflakes.length - 1; i >= 0; i--){
				snowflakes[i].update();
				if(snowflakes[i].isDead){
					// remove it!!
					
					// 1. remove any event-listeners on the object
					snowflakes[i].dispose();
					
					// 2. remove the object from the scene-graph
					removeChild(snowflakes[i]);
					
					// 3. nullify any variables pointing to it
					// if the variable is an array,
					// remove the object from the array
					snowflakes.splice(i, 1);
				}
			} // for loop updating snow
		}
		private function updateBullets():void{
			// update everything:
			for(var i = bullets.length - 1; i >= 0; i--){
				bullets[i].update();
				if(bullets[i].isDead){
					// remove it!!
					
					// 1. remove any event-listeners on the object
					
					// 2. remove the object from the scene-graph
					removeChild(bullets[i]);
					
					// 3. nullify any variables pointing to it
					// if the variable is an array,
					// remove the object from the array
					bullets.splice(i, 1);
				}
			} // for loop updating bullets
		}
		
		private function collisionDetection():void{
			for(var i:int = 0; i < snowflakes.length; i++){
				for(var j:int = 0; j < bullets.length; j++){
					
					var dx:Number = snowflakes[i].x - bullets[j].x;
					var dy:Number = snowflakes[i].y - bullets[j].y;
					var dis:Number = Math.sqrt(dx * dx + dy * dy);
					if(dis < snowflakes[i].radius + bullets[j].radius){
						// collision!
						snowflakes[i].isDead = true;
						bullets[j].isDead = true;
					}
				}				
			}
		}
		
	} // class Game
} // package
