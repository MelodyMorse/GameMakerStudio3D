cam = instance_create_depth(0,-10 * WORLD_UNIT,WORLD_UNIT * 10, obj_camera);
//cam.renderGrid = true;
//coins = [];
//player = instance_create_depth(0, 0, 100, oPlayer);
//cam = instance_create_depth(0,-10 * WORLD_UNIT,WORLD_UNIT * 10, obj_camera);

box = instance_create_depth(0,0,WORLD_UNIT, oPlayer);
//box.y = WORLD_UNIT;
box.model = LoadOBJFile("JustACube.obj");
box.texture = sprite_get_texture(uvtest, 0);

//player.scale = [.75,.75,.75];
//cam.target = player;
/*
for (var i = 0; i < 10; i++)
{
	var xPos = irandom_range(-10, 10);
	var yPos = irandom_range(-10, 10);
	
	coins[i] = instance_create_depth(xPos * WORLD_UNIT, yPos * WORLD_UNIT, 100, obj_coin);
}
*/