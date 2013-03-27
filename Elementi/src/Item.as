package  
{
	import org.flixel.*;
	
	public class Item extends FlxSprite
	{
		
		public var stats:Stats;
		public var owner:Entity;
		
		public function Item() {
			stats = new Stats();
			
			/*stats.addStat("Health", 0, 100);
			stats.addStat("Mana", 0, 100);
			stats.addStat("Stamina", 0, 100);
			stats.addStat("Experience", 0, 100);
			
			stats.addStat("Strength", 0, 100);
			stats.addStat("Agility", 0, 100);
			stats.addStat("Intellect", 0, 100);
			
			stats.addStat("Armor", 0, 1000);
			stats.addStat("Evasion", 0, 1);
			stats.addStat("Crit", 0, 1);*/
			
			makeGraphic(16, 16, 0xffffff00);
		}
		
	}

}