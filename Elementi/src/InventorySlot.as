package  
{
	import org.flixel.*;
	
	public class InventorySlot extends FlxGroup
	{
		
		public var slotSize:int;
		public var slot:FlxSprite;
		public var containedItem:Item;
		
		public var parent:Inventory;
		
		private var dragging:Boolean;
		
		public function InventorySlot(_parent:Inventory) 
		{
			parent = _parent;
			slotSize = 16;
			slot = new FlxSprite();
			slot.makeGraphic(slotSize, slotSize, 0xaaffffff);
			slot.alpha = .2;
			add(slot);
			
			slot.scrollFactor.x = slot.scrollFactor.y = 0;
		}
		
		override public function update():void {
			
			if (FlxG.overlap(new FlxObject(FlxG.mouse.screenX, FlxG.mouse.screenY), slot)) {
				slot.alpha = .6;
			} else {
				slot.alpha = .2;
			}
			
			super.update();
		}
		
		public function addItem(item:Item):void {
			containedItem = item;
			containedItem.x = slot.x;
			containedItem.y = slot.y;
			containedItem.scrollFactor.x = containedItem.scrollFactor.y = 0
			add(containedItem);
		}
		
		public function removeItem():Item {
			var tmpItem:Item = containedItem;
			remove(containedItem);
			containedItem = null;
			return tmpItem;
		}
		
	}

}