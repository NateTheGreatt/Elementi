package
{

	public class MultiplyModifier extends Modifier
	{		
		//----------------------------------------------------------------------
		//
		//  Constructor
		//
		//----------------------------------------------------------------------
		
		public function MultiplyModifier() { super(); }
		
		//----------------------------------------------------------------------
		//
		//  Public methods
		//
		//----------------------------------------------------------------------
		
		public override function modify(value:Number):Number
		{
			value *= super._value * stack;
			return value;
		}
		
	}
}