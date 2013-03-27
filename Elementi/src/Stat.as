package
{
	import org.flixel.*;
	public class Stat extends Object
	{
		//----------------------------------------------------------------------
		//
		//  Public properties
		//
		//----------------------------------------------------------------------
		
		public function get id():String 
		{
			return this._id; 
		}
		
		public function set id(value:String):void 
		{
			this._id = value;
		}
		
		public function get current():Number 
		{ 
			return this._current; 
		 }
		
		public function set current(value:Number):void 
		{
			this._current = value;
			
			if (this._current > this._totalModified)
			{
				this._current = this._totalModified;
			}
		}
		
		public function get totalModified():Number 
		{ 
			return this._totalModified; 
		}
		
		public function get totalUnmodified():Number 
		{ 
			return this._totalUnmodified; 
		}
		
		public function set totalUnmodified(value:Number):void 
		{
			this._totalUnmodified = value;
			this.updateTotalModified();
		}
		
		//----------------------------------------------------------------------
		//
		//  Private properties
		//
		//----------------------------------------------------------------------
		
		private var _id:String = "";
		private var _current:Number = 0;
		private var _totalModified:Number = 0;
		private var _totalUnmodified:Number = 0;
		private var _modifiers:Object = { };
		
		//----------------------------------------------------------------------
		//
		//  Constructor
		//
		//----------------------------------------------------------------------
		
		public function Stat() { super(); }
		
		//----------------------------------------------------------------------
		//
		//  Add/Remove/Update Modifier
		//
		//----------------------------------------------------------------------
		
		public function addModifier(modifier:Modifier):void
		{
			if (!this._modifiers[modifier.id]) 
			{ 
				this._modifiers[modifier.id] = modifier;
			}
			else
			{
				modifier = this._modifiers[modifier.id];
				if (modifier.stackable) { modifier.stack++; }	
			}
			
			this.updateTotalModified();
		}
		
		public function removeModifier(modifierId:String):void
		{
			var modifier:Modifier = this._modifiers[modifierId];
			
			if (modifier) 
			{ 
				modifier.stack--; 
				if (modifier.stack < 1)
				{
					this._modifiers[modifierId] = null;
					delete this._modifiers[modifierId];
				}
			}
			this.updateTotalModified();
		}
		
		private function updateTotalModified():void
		{
			this._totalModified = this._totalUnmodified;
			var modifiers:Array = [];
			
			for (var property:String in this._modifiers)
			{
				modifiers.push(this._modifiers[property]);
			}
			
			modifiers.sortOn("priority", Array.NUMERIC);
			
			var modifier:Modifier;
			var i:int = modifiers.length;
			
			while (i--)
			{
				modifier = modifiers[i];
				this._totalModified = modifier.modify(this._totalModified);
			}
			
		}
		
	}
}