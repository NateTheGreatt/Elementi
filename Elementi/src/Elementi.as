package

{

	import org.flixel.*;

	//[SWF(width="640", height="480", backgroundColor="#000000")]
	//[SWF(width="1280", height="720", backgroundColor="#000000")]
	[SWF(width="640", height="360", backgroundColor="#000000")]

	[Frame(factoryClass="Preloader")]



	public class Elementi extends FlxGame

	{

		public function Elementi()

		{

			//super(320,240,MenuState,2, 60, 60);
			super(640,360,MenuState,1, 60, 60);
			//super(320,180,MenuState,2, 60, 60);
			forceDebugger = true;
		}

	}

}

