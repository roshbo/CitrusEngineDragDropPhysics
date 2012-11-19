package
{
	import com.citrusengine.core.StarlingState;
	import com.citrusengine.objects.platformer.box2d.Platform;
	import com.citrusengine.physics.box2d.Box2D;

	public class GameState extends StarlingState
	{
		
		public function GameState()
		{
			super();
		}
		
		override public function initialize():void 
		{
			super.initialize();
			
			var box2D:Box2D = new Box2D("box2D");
			box2D.visible = GameObjects.debug;
			add(box2D);
			
			add(new Platform("bottom", {x:stage.stageWidth / 2, y:stage.stageHeight-55, width:stage.stageWidth, height: 4, oneWay:true}));
			
			add(new Block("block", {x:stage.stageWidth / 2, y:0, blockType: "quad"}));
		}
	}
}