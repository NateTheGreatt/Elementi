package  
{
	
	import org.flixel.*;
	
	public class LootContainer extends FlxSprite
	{
		
		[Embed(source = 'data/img/chestsheet.png')] private var imgChest:Class;
		
		public var items:Array;
		public var inventory:Inventory;
		
		private var _opened:Boolean;
		
		public function LootContainer(X:int, Y:int) 
		{
			x = X;
			y = Y;
			loadGraphic(imgChest, true, true, 25, 32);
			
			inventory = new Inventory('Loot', this.x - 33, this.y - 18, 1, 5);
			inventory.addItem(new Item());
			inventory.addItem(new Item());
			inventory.addItem(new Item());
			
			addAnimation("Opened", [1],1);
			addAnimation("Closed", [2],1);
			
			play("Closed");
			
			_opened = false;
		}
		
		override public function update():void {
			super.update();
		}
		
		public function get opened():Boolean {
			return _opened;
		}
		
		public function set opened(opened:Boolean):void {
			_opened = opened;
			
			if (_opened) play("Opened");
			else play("Close");
		}
		
	}

}