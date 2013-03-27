package
{

	import org.flixel.*;

	public class MenuState extends FlxState
	{
		
		private var playButton:FlxButton;
		private var devButton:FlxButton;
		private var Title:FlxText;
		
		override public function create():void
		{
			FlxG.bgColor = 0xff000000;
			
			Title = new FlxText(FlxG.width / 2, FlxG.height / 3, 100, "Elementi")
			Title.setFormat(null, 64, 0xFFFFFF, "center", 0xffffff);
			add(Title);
			
			devButton = new FlxButton(FlxG.width/2-40,FlxG.height / 3 + 60, "Insert Site", onSite);
			devButton.color = 0xffD4D943;
			devButton.label.color = 0xffD8EBA2;
			add(devButton);
			
			playButton = new FlxButton(FlxG.width/2-40,FlxG.height / 3 + 100, "Click To Play", onPlay);
			playButton.color = devButton.color;
			playButton.label.color = devButton.label.color;
			add(playButton);
			
			
			FlxG.mouse.show();
			
		}
		
		override public function update():void
		{
			super.update();	
		}
		
		protected function onSite():void
		{
			
			FlxU.openURL("http://example.com/");  //replace with your site's URL 
		}
		
		protected function onPlay():void
		{
			playButton.exists = false;
			FlxG.switchState(new PlayState());
		}
		
		
	}
}

