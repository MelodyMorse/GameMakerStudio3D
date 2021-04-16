#macro WORLD_UNIT 128

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();

global.vFormat = vertex_format_end();
//create and send instructions
instructions = ds_map_create();

ds_map_add(instructions, 0, ["press left"]);
ds_map_add(instructions, 60, ["release left"]);
ds_map_add(instructions, 180, ["press right"]);
ds_map_add(instructions, 240, ["release right"]);
//player.virtualController = true;
//controller.player = player;


<<<<<<< Updated upstream
player = instance_create_depth(500, 100, 900, oPlayer);
cam = instance_create_depth(0,0,0, obj_camera);
cam.target = player;
=======
>>>>>>> Stashed changes


vc =instance_create_depth(0,0,0,ObjVirtualController);
vc.instructions = instructions;
player = instance_create_depth(600, 129, 500, oPlayer);
vc.player = player;
cam = instance_create_depth(600,200,1500, obj_camera);
player.model = LoadOBJFile("JustACube.obj");
player.texture = sprite_get_texture(spr_block, 0);
player.scale = [.75,.75,.75];
cam.target = player;
player.virtualController = vc;

//luigi = instance_create_depth(400,129,400,oGameObject);
//luigi.model = LoadOBJFile("luigi.obj");
//luigi.texture = sprite_get_texture(sprGreen, 0);

box = instance_create_depth(200,61,200,oGameObject);
box.scale = [.5,.5,.5]
box.model = LoadOBJFile("JustACube.obj");
box.texture = sprite_get_texture(spr_block, 0);


