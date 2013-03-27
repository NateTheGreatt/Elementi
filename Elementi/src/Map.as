package  
{
	import org.flixel.*;
	
	public class Map extends FlxGroup
	{
		[Embed(source = 'data/img/withoutB.png')] private var imgBg:Class;
		[Embed(source = 'data/map/mapCSV_Group1_Map1.csv', mimeType = 'application/octet-stream')] private var collisionMap:Class;
		[Embed(source = 'data/img/collisionTiles.png')] private var imgTiles:Class;
		
		public var bg:FlxSprite;
		public var collision:FlxTilemap;
		
		public function Map() 
		{
			bg = new FlxSprite();
			bg.loadGraphic(imgBg);
			add(bg);
			
			collision = new FlxTilemap();
			collision.loadMap(new collisionMap, imgTiles, 8, 8);
			add(collision);
			
			collision.visible = false;
		}
	}

}