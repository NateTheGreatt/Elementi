package  
{
	import org.flixel.*;
	
	public class HUD extends FlxGroup
	{
		
		public var hpBar:GUIBar;
		public var mpBar:GUIBar;
		public var xpBar:GUIBar;
		
		private var player:Player;
		
		public function HUD() 
		{
			hpBar = new GUIBar(5, 5, 0xffff0000, true, 50, 7);
			add(hpBar);
			mpBar = new GUIBar(5, 12, 0xff0000ff, true, 50, 7);
			add(mpBar);
			xpBar = new GUIBar(5, 19, 0xff2cff95, true, 50, 7);
			add(xpBar);
			
			player = PlayState.player;
		}
		
		override public function update():void {
			
			hpBar.setPercent((player.stats.getStatCurrentValue("Health") / player.stats.getStatTotalValueModified("Health")) * hpBar.bg.width);
			mpBar.setPercent((player.stats.getStatCurrentValue("Mana") / player.stats.getStatTotalValueModified("Mana")) * hpBar.bg.width);
			xpBar.setPercent((player.stats.getStatCurrentValue("Experience") / player.stats.getStatTotalValueModified("Experience")) * hpBar.bg.width);
			
			super.update()
		}
		
	}

}