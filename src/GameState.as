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
			
			add(new Platform("top", {x:stage.stageWidth / 2, y:0, width:stage.stageWidth, height: 2}));
			add(new Platform("bottom", {x:stage.stageWidth / 2, y:stage.stageHeight - 55, width:stage.stageWidth, height: 2}));
			add(new Platform("left", {x:0, y:stage.stageHeight / 2, width:2, height: stage.stageHeight}));
			add(new Platform("right", {x:stage.stageWidth - 20, y:stage.stageHeight / 2, width:2, height: stage.stageHeight}));
			
			add(new Block("block", {x:stage.stageWidth / 2, y:stage.stageHeight / 2, blockType: "quad", width: 82, height: 82}));
			add(new Block("character1", {x:(stage.stageWidth / 2) - 80, y:stage.stageHeight / 2, blockType: "character1", width: 60, height: 73}));
			add(new Block("character2", {x:(stage.stageWidth / 2) + 80, y:stage.stageHeight / 2, blockType: "character2", width: 60, height: 80}));
		}
	}
}