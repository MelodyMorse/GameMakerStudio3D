cam = instance_create_depth(0,-10 * WORLD_UNIT,WORLD_UNIT * 0, obj_camera);
show_debug_message("room loaded");
//cam.renderGrid = true;

//cam.grid = buffer_build_grid_vertical([0,0,WORLD_UNIT * 2], [5,10], WORLD_UNIT, c_white, c_ltgray);
cam.mode = CameraMode.Orthographic;

//instance_create_layer(0,0,"Instances", ObjPlayer2D);
global.origin = [room_width/2, room_height/2]

enum gridRender 
{
	nothing,
	axies,
	both
}
render = gridRender.nothing;

p1 = new Vector3(0,0,0);
//e1 = [1,2];


player = SpawnObject(p1, ObjPlayer2D);
//player.position = [-3, -1,0];
//enemy = SpawnObject(e1, objEnemy2D);

