//pos = [0,0]
//1 meter = 1 world unit
//1 sec = 60 frames
//acceleration = 9.8 m/sec/sec
delay = 0;
position = new Vector3(0, 0, 0);
velocity = new Vector3(0,0,0);
rotation = [0, 0, 0];
scale = [1,1,1];

right = [1, 0];
forward = [0, 1];
timeToJumpApex = 1;
jumpHeight = 1;

grav = -9.8;
fallRateMeters = 0;
function LocalToWorldSpace(localPoint, gameObject)
{

	var worldOffsetX = MultiplyVector(gameObject.right, localPoint[0]);
	var worldOffsetY = MultiplyVector(gameObject.forward, localPoint[1]);
	var worldOffset = AddVectors2D(worldOffsetX, worldOffsetY);
	var worldPoint = AddVectors2D(worldOffset, [gameObject.position[0], gameObject.position[1]]);
	
	return worldPoint
}