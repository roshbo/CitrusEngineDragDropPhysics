package
{
	import com.citrusengine.core.CitrusObject;
	import com.citrusengine.objects.Box2DPhysicsObject;
	import com.citrusengine.view.starlingview.AnimationSequence;
	
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.Joints.b2MouseJoint;
	import Box2D.Dynamics.Joints.b2MouseJointDef;
	
	import starling.display.DisplayObject;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Block extends Box2DPhysicsObject
	{
		
		protected var _blockType:String;
		
		private var _jointDef:b2MouseJointDef;
		private var _joint:b2MouseJoint;
		private var _mouseScope:DisplayObject;
		
		private var _draggableArt:AnimationSequence;
		
		public function Block(name:String, params:Object=null)
		{
			super(name, params);
		}
		
		override public function initialize(poolObjectParams:Object = null):void
		{
			super.initialize(poolObjectParams);
			
			if (blockType == "quad")
			{
				_view = new AnimationSequence(Assets.getAtlas("Block01", "Block01Xml"), ["normal"], "normal");
				
				// method 1 - doesnt work
				_draggableArt = _view;
				
				// method 2 - doesnt work
				//_draggableArt = AnimationSequence((view.getArt(this) as StarlingArt).content);
				
				// add event listenners
				_draggableArt.addEventListener(TouchPhase.BEGAN, handleGrab);               
				_draggableArt.addEventListener(TouchPhase.ENDED, handleRelease);
				(_view as AnimationSequence).addEventListener(TouchEvent.TOUCH, handleTouch);
				
			}	
		}
		
		override public function destroy():void
		{
			if (_joint)
			{
				_box2D.world.DestroyJoint(_joint);
			}
			
			super.destroy();
		}
		
		override public function update(timeDelta:Number):void
		{
			super.update(timeDelta);
			
			if (_joint) 
			{
				_joint.SetTarget(new b2Vec2(_mouseScope.x / _box2D.scale, _mouseScope.y / _box2D.scale));
			}
		}
		
		public function enableHolding(mouseScope:DisplayObject):void
		{
			if (_joint)
			{
				return;
			}
			
			_mouseScope = mouseScope;
			_jointDef.target = new b2Vec2(_mouseScope.x / _box2D.scale, _mouseScope.y / _box2D.scale);
			_joint = _box2D.world.CreateJoint(_jointDef) as b2MouseJoint;
		}
		
		public function disableHolding():void
		{
			if (!_joint)
			{
				return;
			}
			
			_box2D.world.DestroyJoint(_joint);
			_joint = null;
		}
		
		public function get blockType():String
		{
			return _blockType;
		}
		
		public function set blockType(value:String):void
		{
			_blockType = value;
		}
		
		override protected function defineJoint():void 
		{	
			super.defineJoint();
			
			_jointDef = new b2MouseJointDef();
			_jointDef.bodyA = _box2D.world.GetGroundBody();
			_jointDef.bodyB = _body;
			_jointDef.dampingRatio = .2;
			_jointDef.frequencyHz = 100;
			_jointDef.maxForce = 100;
		}
		
		override protected function defineBody():void
		{
			super.defineBody();
			_bodyDef.bullet = true;	
		}
		
		override protected function defineFixture():void
		{
			super.defineFixture();
			_fixtureDef.density = 0.1;
			_fixtureDef.restitution = 0;
		}
		
		private function handleTouch(e:TouchEvent):void
		{
			trace("Blocks::handleTouch");
			
			var t:Touch = e.getTouch(_view as DisplayObject);
			
			if (t !== null && t.phase == TouchPhase.BEGAN)
			{
				trace("Blocks::handleTouch - touch began");
				enableHolding(t.target); // doesnt works
				//enableHolding(_view); //doesnt works
			}
			else if (t !== null && t.phase == TouchPhase.ENDED)
			{
				trace("Blocks::handleTouch - touch end");
				disableHolding();
			}
		}
		
		private function handleGrab(e:TouchEvent):void
		{
			trace("Blocks::handleGrab");
			
			var clickedObject:CitrusObject = view.getObjectFromArt(e.currentTarget) as CitrusObject;
			
			trace(clickedObject);
			
			if (clickedObject)
			{
				enableHolding(DisplayObject(e.currentTarget).parent);
			}
		}
		
		private function handleRelease(e:TouchEvent):void
		{
			trace("Blocks::handleRelease");
			disableHolding();
		}

	}
}