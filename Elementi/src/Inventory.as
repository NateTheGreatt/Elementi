package  
{
	import org.flixel.*;
	
	public class Inventory extends FlxGroup
	{
		
		private var bg:FlxSprite;
		private var txt:FlxText;
		
		private var grabbedItem:Item;
		public var dragging:Boolean;
		
		private var bgDrag:Boolean;
		private var mouseOffset:FlxPoint = new FlxPoint();
		
		private var _x:Number
		private var _y:Number
		
		public function Inventory(name:String, X:int=225, Y:int=10, rows:int=5, cols:int=5) 
		{
			
			bg = new FlxSprite(X - 2, Y - 10);
			bg.makeGraphic(cols * 17 + 3, rows * 17 + 11, 0xff222222);
			bg.scrollFactor.x = bg.scrollFactor.y = 0;
			add(bg);
			
			txt = new FlxText(bg.x + 1, bg.y + 1, bg.width, name);
			txt.scrollFactor.x = txt.scrollFactor.y = 0;
			add(txt);
			
			bgDrag = false;
			
			var slot:InventorySlot;
			var spacing:int = 1;
			var initX:int = X;
			var initY:int = Y;
			var nX:int = initX;
			var nY:int = initY;
			
			for (var i:int = 0; i < rows; i++) {
				for (var j:int = 0; j < cols; j++) {
					slot = new InventorySlot(this);
					slot.slot.x = nX;
					slot.slot.y = nY;
					add(slot);
					nX += slot.slotSize + spacing;
				}
				nY += slot.slotSize + spacing;
				nX = initX;
			}
		}
		
		override public function update():void {
			
			if (FlxG.mouse.justPressed()) {
				if (bg.overlapsPoint(FlxG.mouse.getScreenPosition())) {
					FlxG.log('yey');
					mouseOffset.x = FlxG.mouse.screenX - x;
					mouseOffset.y = FlxG.mouse.screenY - y;
					bgDrag = true;
				}
			}
			
			if (FlxG.mouse.justReleased()) {
				bgDrag = false;
				mouseOffset.x = 0;
				mouseOffset.y = 0;
			}
			
			super.update();
			
			if (bgDrag) {
				x = FlxG.mouse.screenX - mouseOffset.x;
				y = FlxG.mouse.screenY - mouseOffset.y;
			}
		}
		
		public function placeItem(item:Item, prevSlot:InventorySlot):void {
			for (var i:int = 0; i < members.length; i++) {
				if(FlxG.overlap(new FlxObject(FlxG.mouse.screenX, FlxG.mouse.screenY), members[i])) {
					if (members[i].containedItem == null) {
						members[i].addItem(item);
						break;
					} else {
						break;
					}
				}
			}
		}
		
		public function addItem(item:Item):void {
			for (var i:int = 0; i < members.length; i++) {
				// the first InventorySlot found with no item contained is where the item is added
				if (members[i] is InventorySlot && members[i].containedItem == null) {
					members[i].addItem(item);
					break;
				}
			}
		}
		
		public function get x():int { return _x; }
		
		public function set x(value:int):void 
		{
			var diff:int = value - _x;
			for each (var item:* in members)
			{
				if (item is InventorySlot) {
					item.slot.x += diff;
					if(item.containedItem != null) item.containedItem.x += diff;
				}
				if (item is FlxObject) item.x += diff;
			}
			_x = value;
		}
		
		public function get y():int { return _y; }
		
		public function set y(value:int):void 
		{
			var diff:int = value - _y;
			for each (var item:* in members)
			{
				if (item is InventorySlot) {
					item.slot.y += diff;
					if(item.containedItem != null) item.containedItem.y += diff;
				}
				if (item is FlxObject) item.y += diff;
			}
			_y = value;
		}
		
	}

}