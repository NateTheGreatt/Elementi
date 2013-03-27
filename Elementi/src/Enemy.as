package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class Enemy extends EntityDynamic
	{
		
		private var beenHit:Boolean;
		
		public function Enemy(X:Number, Y:Number) 
		{
			super(X, Y);
			sprite.makeGraphic(SIZE.x, SIZE.y, 0xffff0000);
			beenHit = false;
			
			stats.setStatCurrentValue("Experience", 40);
		}
		
		override public function update():void {
			super.update();
			FlxG.overlap(sprite, PlayState.player.hitbox, enemyHit);
			sprite.velocity.x = sprite.velocity.y = 0;
			beenHit = false;
		}
		
		private function enemyHit(s:FlxSprite, h:FlxSprite):void {
			if (!beenHit) {
				hit(PlayState.player.damage, PlayState.player.sprite);
				FlxG.log("hit");
			}
		}
		
		override public function hit(dmg:Number, target:FlxSprite = null, knockBack:Boolean = false, effects:Array = null):void {
			beenHit = true;
			target = PlayState.player.sprite;
			super.hit(dmg, target, knockBack, effects);
		}
		
		override public function kill():void {
			PlayState.player.addXP(stats.getStatCurrentValue("Experience"));
			super.kill();
		}
		
	}

}