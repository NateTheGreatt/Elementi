package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Entity extends FlxGroup
	{
		public static const SIZE:FlxPoint = new FlxPoint(24, 24);
		
		public var target:FlxObject;
		public var sprite:FlxSprite;
		public var healthBar:GUIBar;
		public var curHealth:Number;
		public var maxHealth:Number;
		
		public var stats:Stats;
		
		public function Entity(X:Number,Y:Number) 
		{
			sprite = new FlxSprite(X, Y);
			sprite.makeGraphic(SIZE.x, SIZE.y, 0xfa00f034);
			add(sprite);
			
			healthBar = new GUIBar(X, Y);
			add(healthBar);
			
			stats = new Stats();
			stats.addStat("Health", 100, 100);
			stats.setStatCurrentValue("Health", 100);
			FlxG.log('entity instantiated');
		}
		
		override public function update():void {
			super.update();
			
			healthBar.align(sprite);
			
			if(curHealth != stats.getStatCurrentValue("Health")) curHealth = stats.getStatCurrentValue("Health");
			if(maxHealth != stats.getStatTotalValueModified("Health")) maxHealth = stats.getStatTotalValueModified("Health");
			
		}
		
		private function recalculateHP():void
		{
			healthBar.bar.scale.x = (stats.getStatCurrentValue("Health") / stats.getStatTotalValueModified("Health")) * healthBar.bg.width;
			
			if (stats.getStatCurrentValue("Health") <= 0) {
				stats.setStatCurrentValue("Health", 0);
				healthBar.bar.visible = false;
				this.kill();
			} else {
				healthBar.bar.visible = true;
			}
		}
		
		public function hit(dmg:Number, target:FlxSprite = null, knockBack:Boolean = false, effects:Array = null):void {
			stats.setStatCurrentValue("Health", stats.getStatCurrentValue("Health") - dmg);
			if (knockBack) { 
				var dx:Number = target.x - sprite.x;
				var dy:Number = target.y - sprite.y;
				var tmpAngle:Number = Math.atan2(dy, dx);
				sprite.velocity.x = -Math.cos(tmpAngle) * 500;
				sprite.velocity.y = -Math.sin(tmpAngle) * 500;
			}
			
			recalculateHP();
		}
		
		override public function kill():void {
			PlayState.worldDrops.add(new LootContainer(this.sprite.x, this.sprite.y));
			super.kill();
		}
		
	}

}