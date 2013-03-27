package  
{
	import org.flixel.*;
	
	public class Equipment extends Inventory
	{
		
		public function Equipment(name:String, X:int=10, Y:int=10, rows:int=5, cols:int=1) 
		{
			super(name, X, Y, rows, cols);
		}
		
		override public function update():void {
			
			super.update();
		}
	}

}