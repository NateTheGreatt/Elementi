package  
{
	import org.flixel.*;
	
	public class GUIBar extends FlxGroup
	{
		public var frame:FlxSprite;
		public var bg:FlxSprite;
		public var bar:FlxSprite;
		
		public function GUIBar(X:Number, Y:Number, color:uint = 0xffff0000, HUD:Boolean = false, width:Number = 24, height:Number = 5) 
		{
			frame = new FlxSprite(X, Y);
			frame.makeGraphic(width, height, 0xff222222);
			add(frame)
			
			bg = new FlxSprite(X+1, Y+1);
			bg.makeGraphic(width-2, height-2, 0xff000000);
			add(bg);
			
			bar = new FlxSprite(X + 1, Y + 1);
			bar.makeGraphic(1, height-2, color);
			add(bar);
			
			bar.scale.x = bg.width;
			bar.origin.x = bar.origin.y = 0;
			
			bar.solid = frame.solid = bg.solid = false;
			
			if (HUD) bar.scrollFactor.x = bar.scrollFactor.y = frame.scrollFactor.x = frame.scrollFactor.y = bg.scrollFactor.x = bg.scrollFactor.y = 0;
			
		}
		
		override public function update():void {
			super.update();
		}
		
		public function align(sprite:FlxSprite):void {
			if (frame.x != sprite.x) frame.x = sprite.x;
			if (frame.y != sprite.y - 16) frame.y = sprite.y - 16;
			if (bar.x != frame.x + 1) bar.x = frame.x + 1;
			if (bar.y != frame.y + 1) bar.y = frame.y + 1;
			if (bg.x != frame.x + 1) bg.x = frame.x + 1;
			if (bg.y != frame.y + 1) bg.y = frame.y + 1;
		}
		
		public function setPercent(percent:Number):void {
			bar.scale.x = percent;
		}
		
	}

}