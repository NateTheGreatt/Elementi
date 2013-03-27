package  
{
	import flash.utils.Dictionary;
	import org.flixel.*;
	
	public class EntityDynamic extends Entity
	{
		
		public var hitbox:FlxSprite;
		
		public function EntityDynamic(X:Number, Y:Number) 
		{
			FlxG.log('dynamic entity instantiated');
			super(X, Y);
			
			stats.addStat("Mana", 100, 100);
			stats.setStatCurrentValue("Mana", 100);
			
			stats.addStat("Stamina", 100, 100);
			stats.setStatCurrentValue("Stamina", 100);
			
			stats.addStat("Experience", 0, 100);
			stats.setStatCurrentValue("Experience", 0);
			
			stats.addStat("Strength", 1, 100);
			stats.setStatCurrentValue("Strength", 1);
			stats.addStat("Agility", 1, 100);
			stats.setStatCurrentValue("Agility", 1);
			stats.addStat("Intellect", 1, 100);
			stats.setStatCurrentValue("Intellect", 1);
			
			stats.addStat("Armor", 0, 1000);
			stats.addStat("Evasion", 0, 1);
			stats.addStat("Crit", 0, 1);
			
			
			hitbox = new FlxSprite(X, Y);
			hitbox.makeGraphic(16, 24, 0xfffffff0);
			hitbox.x = sprite.x;
			hitbox.y = sprite.y;
			hitbox.solid = false;
			hitbox.visible = false;
			add(hitbox);
		}
		
		override public function update():void {
			super.update();
		}
		
	}

}