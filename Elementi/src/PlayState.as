package
{

	import org.flixel.*;

	public class PlayState extends FlxState
	{
		
		[Embed(source = 'data/img/withoutB.png')] private var imgWorldBG:Class;
		
		public static var camera:FlxCamera;
		
		public static var map:Map;
		
		public static var player:Player
		public static var inventory:Inventory;
		public static var equipment:Equipment;
		public static var worldDrops:FlxGroup;
		public static var worldContainer:Inventory;
		public static var lootContainer:LootContainer;
		public static var grabbedItem:FlxSprite;
		public static var dragging:Boolean;
		
		public static var enemies:FlxGroup;
		
		public var hud:HUD;
		
		override public function create():void
		{
			
			FlxG.debug = true;
			
			camera = new FlxCamera(0, 0, FlxG.width, FlxG.height);
			FlxG.resetCameras(camera);
			FlxG.worldBounds = new FlxRect(0, 0, 4564, 2048);
			camera.bounds = FlxG.worldBounds;
			
			map = new Map();
			add(map);
			
			worldDrops = new FlxGroup();
			add(worldDrops);
			
			player = new Player(500, 500);
			add(player);
			FlxG.camera.follow(player.sprite, FlxCamera.STYLE_TOPDOWN_TIGHT);
			
			enemies = new FlxGroup();
			add(enemies);
			var enemy:Enemy = new Enemy(100, 50);
			enemies.add(enemy);
			enemy = new Enemy(150, 100);
			enemies.add(enemy);
			enemy = new Enemy(200, 100);
			enemies.add(enemy);
			enemy = new Enemy(250, 100);
			enemies.add(enemy);
			enemy = new Enemy(300, 100);
			enemies.add(enemy);
			enemy = new Enemy(350, 100);
			enemies.add(enemy);
			enemy = new Enemy(400, 100);
			enemies.add(enemy);
			enemy = new Enemy(450, 100);
			enemies.add(enemy);
			
			inventory = new Inventory('Inventory');
			inventory.visible = false;
			add(inventory);
			
			var t:Item = new Item();
			t.makeGraphic(16, 16, 0xffff00ff);
			inventory.addItem(t);
			
			t = new Item();
			t.makeGraphic(16, 16, 0xff00ff00);
			inventory.addItem(t);
			
			equipment = new Equipment('Equipment');
			equipment.visible = false;
			add(equipment);
			
			hud = new HUD();
			add(hud);
		}
		
		override public function update():void
		{
			
			super.update();
			FlxG.collide(player.sprite, enemies);
			FlxG.collide(enemies, enemies);
			FlxG.collide(player.sprite, map.collision);
			
			
			manageInventory();
			looting();
		}
		
		private function manageInventory():void {
			
			if (FlxG.mouse.justPressed()) {
				if (FlxG.overlap(new FlxObject(FlxG.mouse.screenX, FlxG.mouse.screenY), inventory) && inventory.visible) {
					clickedContainer(inventory);
				}
				if (FlxG.overlap(new FlxObject(FlxG.mouse.screenX, FlxG.mouse.screenY), equipment) && equipment.visible) {
					clickedContainer(equipment);
				}
				if (FlxG.overlap(new FlxObject(FlxG.mouse.screenX, FlxG.mouse.screenY), worldContainer) && worldContainer.visible) {
					clickedContainer(worldContainer);
				}
			}
			
			if (dragging) {
				add(grabbedItem);
				grabbedItem.x = FlxG.mouse.screenX - grabbedItem.width / 2;
				grabbedItem.y = FlxG.mouse.screenY - grabbedItem.height / 2;
				grabbedItem.solid = false;
			} else {
				remove(grabbedItem);
				grabbedItem = null;
			}
			
			if (FlxG.keys.justPressed("I")) {
				if (inventory.visible) {
					inventory.visible = false;
				} else {
					inventory.visible = true;
				}
			}
			if (FlxG.keys.justPressed("K")) {
				if (equipment.visible) {
					equipment.visible = false;
				} else {
					equipment.visible = true;
				}
			}
		}
		
		private function clickedContainer(container:Inventory):void {
			for (var i:int = 0; i < container.members.length; i++) { // loop thru members
				if(container.members[i] is InventorySlot) {
					if (FlxG.overlap(new FlxObject(FlxG.mouse.screenX, FlxG.mouse.screenY), container.members[i])) { // overlaps an container slot
						if (!dragging) { // not dragging
							if (container.members[i].containedItem != null) { // if there's an item in the slot
								grabbedItem = container.members[i].removeItem(); // pull it out
								dragging = true;
							}
						} else { // dragging
							if (container.members[i].containedItem != null) { // if there's an item in the slot
								var tmpItem:Item = container.members[i].removeItem(); // store removed item in temp var
								container.members[i].addItem(grabbedItem); // add dragged item to slot
								grabbedItem = tmpItem;
								dragging = true;
							} else { // no item in slot
								container.members[i].addItem(grabbedItem); // add dragged item to slot
								dragging = false;
							}
						}
					}
				}
			}
		}
		
		private function looting():void {
			if (FlxG.keys.justPressed("E")) {
				FlxG.overlap(player.sprite, worldDrops, lootIt);
			}
			
			if (!FlxG.overlap(player.sprite, lootContainer) && worldContainer!=null && worldContainer.visible) {
				worldContainer.visible = false;
				var count:int = 0;
				for (var i:String in worldContainer.members) {
					if (worldContainer.members[i] is InventorySlot)
						if (worldContainer.members[i].containedItem != null) {
							count++;
						}
				}
				if (count <= 0) {
					worldContainer.kill();
					lootContainer.kill();
				}
			}
		}
		
		private function lootIt(p:FlxSprite, loot:LootContainer):void {
			loot.opened = true;
			worldContainer = loot.inventory;
			worldContainer.visible = true;
			lootContainer = loot;
			add(worldContainer);
		}
	}
}

