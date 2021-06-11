function Vector3(x, y, z) constructor {
	self.x = x;
	self.y = y;
	self.z = z;
}
function Vector2(x, y) constructor {
	self.x = x;
	self.y = y;
}

/// @function AddVectors2D(v1, v2)
/// @description Adds two 2D Vectors together and returns sum
/// @param v1 first 2D Vector (array of length two) to add
/// @param v2 second 2D Vector (array of length two) to add
function AddVectors2D(v1, v2)
{
	return new Vector2(v1.x + v2.x, v1.y + v2.y);	
}
/// @function VectorFromTo2D(from, to)
/// @description Returns the Vector between two 2D points
/// @param from 2D Vector (array of length two) to start from
/// @param to 2D Vector (array of length two) representing destination
function VectorFromTo2D(from, to)
{
	return [to[0] - from[0],to[1] - from[1]]
}

/// @function VectorMagnitude2D
/// @description Returns the magnitude of a 2D Vector
/// @param vector 2D Vector (array of length two) to calculate magnitude
function VectorMagnitude2D(vector)
{
	return sqrt(sqr(vector[0]) + sqr(vector[1]))	
}

/// @function MoveInstanceTo2D(pos, instance)
/// @description Moves an instance to a specified position in 2D world space instantly
/// @param pos 2D point (array of length two) in world space coordinates to move a gameobject to instantly
/// @param instance Gameobject instance to move
function MoveInstanceTo2D(pos, instance)
{
	var sPos = WorldToScreenVector(pos);
	instance.x = sPos[0];
	instance.y = sPos[1];
}
/// @function WorldToScreenVevtor(worldpoint)
/// @description Takes a point in 2D world space and converts to screen coordinates
/// @param worldpoint 2D point (array of length 2) in worldspace coordinates
function WorldToScreenVector(worldPoint)
{
	return [global.origin[0] + worldPoint[0] * WORLD_UNIT, global.origin[1] + -worldPoint[1] * WORLD_UNIT]
}

function ScreenToWorldVector(screenPoint)
{
	return [(screenPoint[0] - global.origin[0]) / global.unit,
	-(screenPoint[1] - global.origin[1]) / global.unit];
}

function SpawnObject(pos, obj)
{
	try
	{
		var _x = pos.x * WORLD_UNIT;
		var _y = pos.y * WORLD_UNIT;
		var _z = pos.z * WORLD_UNIT;
	}
	catch(ex)
	{
		var _x = 0;
		var _y = 0;
		var _z = 0;
	}
	
	return instance_create_depth(_x, _y, _z, obj);
	
}
function MultiplyVector(vector, scalar)
{
	return [vector[0] * scalar, vector[1] * scalar]		
}
function NormalizedVector(vector)
{
	var len = VectorMagnitude2D(vector);
	return MultiplyVector(vector, 1/len); 	
}
function CrossProduct2D(vector1, vector2)
{
		
}
function DrawVector(origin, vector)
{
	var p1 = WorldToScreenVector(origin);
	var p2 = WorldToScreenVector(AddVectors2D(origin, vector));
	draw_arrow(p1[0], p1[1], p2[0], p2[1],10);		
}

function DrawCircle(center, radius, outline)
{
	var c = WorldToScreenVector(center);
	draw_circle(c[0], c[1], radius, outline);
}

