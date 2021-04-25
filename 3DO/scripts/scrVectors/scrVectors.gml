function AddVectors2D(v1, v2)
{
	return [v1[0] + v2[0], v1[1] + v2[1] ];	
}
function VectorFromTo(from, to)
{
	return [to[0] - from[0],to[1] - from[1]]
}

function VectorMagnitude(vector)
{
	return sqrt(sqr(vector[0]) + sqr(vector[1]))	
}

function MoveInstanceTo(pos, instance)
{
	var sPos = WorldToScreenVector(pos);
	instance.x = sPos[0];
	instance.y = sPos[1];
}

function WorldToScreenVector(worldPoint)
{
	return [global.origin[0] + worldPoint[0] * global.unit, global.origin[1] + -worldPoint[1] * global.unit]
}

function ScreenToWorldVector(screenPoint)
{
	return [(screenPoint[0] - global.origin[0]) / global.unit,
	-(screenPoint[1] - global.origin[1]) / global.unit];
}

function SpawnObject(pos, obj)
{
	var sPoint = WorldToScreenVector(pos)
	return instance_create_layer(sPoint[0], sPoint[1],"Instances", obj);
	
}
function MultiplyVector(vector, scalar)
{
	return [vector[0] * scalar, vector[1] * scalar]		
}
function NormalizedVector(vector)
{
	var len = VectorMagnitude(vector);
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

