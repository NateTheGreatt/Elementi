package  
{
	import org.flixel.*;
	import flash.utils.*;
	import flash.xml.XMLNode;
	import org.flashdevelop.utils.FlashConnect;
	
	public class ItemFactory
	{
		
		[Embed(source = 'assets/xml/Items.xml', mimeType = "application/octet-stream")] private var xmlItems:Class;
		
		private var byteArray:ByteArray;
		private var itemsXML:XML = new XML();
		
		public function ItemFactory()
		{
			//test items
			byteArray = new xmlItems as ByteArray;
			itemsXML = new XML(byteArray);
		}
		
		public function createItem(type:String,name:String):Item
		{
			switch(type) {
				case 'Item':
					return makeItem(name);
				break;
				case 'Weapon':
					return makeWeapon(name);
				break;
			}
			
			return null;
		}
		
		private function makeItem(name:String):Item
		{
			//use this structure for every make() function
			var item:Item = new Item();
			var found:Boolean = false;
			var items:XMLList = itemsXML.item;
			
			for each(var node:XML in items) {
				if (node.@name == name) {
					// this is where attributes are defined
					item.name = node.@name;
					if (node.@color) item.color = node.@color;
					if (node.@hp) item.stats.addAdditionModifierToStat("Health", "+hp", node.@hp);
					if (node.@mp) item.stats.addAdditionModifierToStat("Mana", "+mp", node.@mp);
					if (node.@str) item.stats.addAdditionModifierToStat("Strength", "+str", node.@str);
					if (node.@dex) item.stats.addAdditionModifierToStat("Dexterity", "+dex", node.@str);
					if (node.@int) item.stats.addAdditionModifierToStat("Intelligence", "+int", node.@str);
					item.makeGraphic(10, 10);
					found = true;
				}
			}
			
			if (found) return item;
			else { 
				FlxG.log('Item ' + name + ' not found in Items.xml');
				return null;
			}
		}
		
		private function makeWeapon(name:String):Weapon
		{
			//use this structure for every make() function
			var weapon:Weapon = new Weapon();
			var found:Boolean = false;
			var weapons:XMLList = weaponsXML.weapon;
			
			for each(var node:XML in weapons) {
				if (node.@name == name) {
					// this is where attributes are defined
					weapon.name = node.@name;
					weapon.damage = node.@damage;
					weapon.reloadTime = node.@reloadTime;
					weapon.shotDelay = node.@shotDelay;
					weapon.clipSize = node.@clipSize;
					weapon.accuracy = node.@accuracy;
					weapon.offsetX = node.@offsetX;
					weapon.offsetY = node.@offsetY;
					if (node.@semi == 'true') weapon.semi = true;
					if (node.@auto == 'true') weapon.auto = true;
					if (node.@burst == 'true') weapon.burst = true;
					if (node.@scatter == 'true') weapon.scatter = true;
					//weapon.setImage(weapon.name);
					weapon.loadGraphic(Registry["img" + weapon.name]);
					found = true;
				}
			}
			
			if (found) return weapon;
			else { 
				FlxG.log('Item ' + name + ' not found in Weapon XML file.');
				return null;
			}
		}
		
	}

}