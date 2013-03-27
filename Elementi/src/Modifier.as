package
{
	
	public class Modifier extends Object
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
		
		public function get value():Number 
		{ 
			return this._value;
		}
		
		public function set value(value:Number):void 
		{
			this._value = value;
		}
		
		public function get stack():Number 
		{ 
			return this._stack; 
		}
		
		public function set stack(value:Number):void 
		{
			this._stack = value;
		}
		
		public function get stackable():Boolean 
		{ 
			return this._stackable; 
		}
		
		public function set stackable(value:Boolean):void 
		{
			this._stackable = value;
		}
		
		public function get priority():int
		{
			return this._priority;
		}
		
		public function set priority(value:int):void
		{
			this._priority = value;
		}
		
		//----------------------------------------------------------------------
		//
		//  Protected properties
		//
		//----------------------------------------------------------------------
		
		protected var _id:String = "";
		protected var _value:Number = 0;
		protected var _stack:Number = 1;
		protected var _stackable:Boolean;
		protected var _priority:int;
		
		//----------------------------------------------------------------------
		//
		//  Constructor
		//
		//----------------------------------------------------------------------
		
		public function Modifier() { super(); }
		
		//----------------------------------------------------------------------
		//
		//  Public methods
		//
		//----------------------------------------------------------------------
		
		public function modify(value:Number):Number
		{
			return value;
		}
		
	}
}