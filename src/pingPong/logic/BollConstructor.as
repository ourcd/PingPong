package pingPong.logic 
{
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2Fixture;
	import core.Box2D.utils.Box2DWorldController;
	import core.view.gameobject.config.GameobjectConfig;
	import core.view.gameobject.GameObject;
	import core.view.gameobject.physicalpropeties.PhysicModel;
	import core.view.gameobject.physicalpropeties.SimplePhysicalProperties;
	import pingPong.view.gameObjectsSkins.BollSkin;
	import starling.display.DisplayObjectContainer;
	
	/**
	 * ...
	 * @author Nikro
	 */
	public class BollConstructor// extends PlayerConstructor 
	{
		
		public function BollConstructor() 
		{
			
		}
		
		public function make(stage:DisplayObjectContainer, worldController:Box2DWorldController):GameObject 
		{
			var config:GameobjectConfig = new GameobjectConfig(true);
			//rabbitConfig.physicConfiguration.friction = 1;
			config.type = 2; //todo replace
			config.shapeType = 1; //todo replace
			config.skinClass = BollSkin;
			
			var gameObject:GameObject = worldController.constructGameObject(GameObject, config, new PhysicModel(0.07, 0, 0),  stage);
			gameObject.physicalProperties.physicModel.fixedRotation = false;
			
			var body:b2Body = (gameObject.physicalProperties as SimplePhysicalProperties).physicBodyKey
			
			body.SetBullet(true);
			body.SetAngularDamping(0.01);
			var fix:b2Fixture = body.GetFixtureList();
			
			body.SetAngularVelocity(1)
			fix.SetRestitution(1);
			fix.SetDensity(0.1);
			fix.SetFriction(0);
			
			body.SetSleepingAllowed(false);
			
			
			
			return gameObject;
		}
		
	}

}