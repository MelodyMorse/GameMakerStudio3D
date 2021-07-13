cam = instance_create_depth(-10 * WORLD_UNIT,0,WORLD_UNIT * 1, obj_camera);
cam.active = true;
//cam2 = instance_create_depth(0,-11 * WORLD_UNIT,WORLD_UNIT * 1, obj_camera);
//cam2.active = true;
cam.renderGrid = true;
cam.enableFPC = true;
//cam2.enableFPC = true;
//coins = [];
//player = instance_create_depth(0, 0, 100, oPlayer);
//cam = instance_create_depth(0,-10 * WORLD_UNIT,WORLD_UNIT * 10, obj_camera);

cube = instance_create_depth(0,0,WORLD_UNIT, oPlayer);
//box.y = WORLD_UNIT;
cube.model = LoadOBJFile("JustACube.obj");
cube.texture = sprite_get_texture(spr_block, 0);


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