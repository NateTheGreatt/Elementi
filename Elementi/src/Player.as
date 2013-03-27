package  
{
	
	import org.flixel.*;
	
	public class Player extends EntityDynamic
	{
		
		private const speed:Number = 80;
		
		public var damage:Number;
		
		public var level:uint;
		
		public function Player(X:Number, Y:Number) 
		{
			super(X, Y);
			damage = 50;
			level = 1;
			
			healthBar.visible = false;
			
			FlxG.watch(this, "level");
		}
		
		override public function update():void {
			super.update();
			attacking();
			movement();
		}
		
		private function castHitbox():void {
			
			var distFromPlayer:Number = 24;
			
			var tmpAngle:Number = FlxU.getAngle(new FlxPoint(sprite.getScreenXY().x + sprite.width/2, sprite.getScreenXY().y + sprite.height/2), new FlxPoint(FlxG.mouse.screenX, FlxG.mouse.screenY));
			var tmpPoint:FlxPoint = FlxU.rotatePoint(sprite.x, -sprite.y + distFromPlayer, sprite.x, sprite.y, tmpAngle);
			
			hitbox.angle = tmpAngle+90;
			hitbox.x = tmpPoint.x+3;
			hitbox.y = tmpPoint.y;
			
			hitbox.visible = true;
			hitbox.solid = true;
		}
		
		private function uncastHitbox():void {
			hitbox.visible = false;
			hitbox.solid = false;
		}
		
		private function attacking():void {
			if (FlxG.mouse.justPressed()) {
				castHitbox();
			} else {
				uncastHitbox();
			}
		}
		
		private function movement():void {
			
			sprite.velocity.x = sprite.velocity.y = 0;
			
			if (FlxG.keys.pressed("A"))
				moveLeft();
			
			if (FlxG.keys.pressed("D"))
				moveRight();
			
			if (FlxG.keys.pressed("W"))
				moveUp();
			
			if (FlxG.keys.pressed("S"))
				moveDown();
			
		}
		
		private function moveLeft():void {
			sprite.velocity.x = -speed;
		}
		
		private function moveRight():void {
			sprite.velocity.x = speed;
		}
		
		private function moveUp():void {
			sprite.velocity.y = -speed;
		}
		
		private function moveDown():void {
			sprite.velocity.y = speed;
		}
		
		public function getAimAngle():Number
		{
			var dx:Number = sprite.x+(sprite.width/2) - FlxG.mouse.x;
			var dy:Number = sprite.y+(sprite.height/2) - FlxG.mouse.y;
			var _angle:Number = Math.atan2(dy, dx);
			_angle = _angle * 180 / Math.PI - 90;
			
			return _angle;
		}
		
		public function addXP(amount:int):void {
			var curXP:int = stats.getStatCurrentValue("Experience");
			var newXP:int = curXP + amount;
			
			if (newXP >= stats.getStatTotalValueUnmodified("Experience")) {
				var remainder:int = newXP - stats.getStatTotalValueUnmodified("Experience");
				var nextLvlMult:Number = level/10;
				var newTotalXp:int = stats.getStatTotalValueUnmodified("Experience") + (stats.getStatTotalValueUnmodified("Experience") * nextLvlMult);
				stats.setStatTotalValueUnmodified("Experience", newTotalXp);
				stats.setStatCurrentValue("Experience", remainder);
				level++;
			} else {
				stats.setStatCurrentValue("Experience", stats.getStatCurrentValue("Experience") + amount);
			}
			
		}
		
	}

}