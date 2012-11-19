package
{
	import com.citrusengine.core.StarlingCitrusEngine;
	
	[SWF(frameRate="60")]
	public class CitrusEngineDragDropPhysics extends StarlingCitrusEngine
	{
		public function CitrusEngineDragDropPhysics()
		{
			super();
			setUpStarling(GameObjects.debug);
			state = new GameState();
		}
	}
}