package
{

	public class AdditionModifier extends Modifier
	{
		//----------------------------------------------------------------------
		//
		//  Constructor
		//
		//----------------------------------------------------------------------
		
		public function AdditionModifier() { super(); }
		
		//----------------------------------------------------------------------
		//
		//  Public methods
		//
		//----------------------------------------------------------------------
		
		public override function modify(value:Number):Number
		{
			value += super._value * stack;
			return value;
		}
		
	}
}