//instance_create_layer(0,0,"Instances", ObjPlayer2D);
global.origin = [room_width/2, room_height/2]
global.unit = 128;
enum gridRender 
{
	nothing,
	axies,
	both
}
render = gridRender.nothing;

p1 = [0, 0];
e1 = [1,2];


player = SpawnObject(p1, ObjPlayer2D);
player.position = [-3, -1,0];
//enemy = SpawnObject(e1, objEnemy2D);

