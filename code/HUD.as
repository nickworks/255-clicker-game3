package code {
	
	import flash.display.MovieClip;
	
	
	public class HUD extends MovieClip {
		
		
		public function HUD() {
			// constructor code
		}
		public function update(game:Game):void {
			
			parent.setChildIndex(this, parent.numChildren - 1);
			
			scoreboard.text = "score: " + game.score;
			bar.scaleX = game.powerupSlowmoTimer / game.powerupSlowmoMax;
			
			heart1.visible = (game.player.health >= 1);
			heart2.visible = (game.player.health >= 2);
			heart3.visible = (game.player.health >= 3);
			heart4.visible = (game.player.health >= 4);
			
		}
	}
	
}
