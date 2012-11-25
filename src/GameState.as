package
{
	import com.citrusengine.core.StarlingState;
	import com.citrusengine.objects.CitrusSprite;
	import com.citrusengine.objects.platformer.box2d.Platform;
	import com.citrusengine.physics.box2d.Box2D;
	import com.citrusengine.view.starlingview.AnimationSequence;

	public class GameState extends StarlingState
	{
		
		public function GameState()
		{
			super();
		}
		
		override public function initialize():void 
		{
			super.initialize();
			
			var backgroundAnimation:AnimationSequence = new AnimationSequence(Assets.getAtlas("BackgroundGame", "BackgroundGameXml"), ["bg"], "bg");
			var background:CitrusSprite = new CitrusSprite("background", {view:backgroundAnimation});
			add(background);
			
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
			add(new Block("character3", {x:(stage.stageWidth / 2), y:stage.stageHeight / 2, blockType: "character3", width: 60, height: 93}));
			add(new Block("character4", {x:(stage.stageWidth / 2) - 80, y:stage.stageHeight / 2, blockType: "character4", width: 60, height: 76}));
			add(new Block("character5", {x:(stage.stageWidth / 2) + 80, y:stage.stageHeight / 2, blockType: "character5", width: 60, height: 121}));
			add(new Block("character6", {x:(stage.stageWidth / 2), y:stage.stageHeight / 2, blockType: "character6", width: 60, height: 74}));
			add(new Block("character7", {x:(stage.stageWidth / 2) - 80, y:stage.stageHeight / 2, blockType: "character7", width: 60, height: 77}));			
		}
	}
}