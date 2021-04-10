#macro WORLD_UNIT 128

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();

global.vFormat = vertex_format_end();

player = instance_create_depth(500, 100, 500, oPlayer);
cam = instance_create_depth(500,400,1000, obj_camera);
player.model = LoadOBJFile("luigi.obj");
player.texture = sprite_get_texture(sprGreen, 0);
cam.target = player;


//luigi = instance_create_depth(400,129,400,oGameObject);
//luigi.model = 
//luigi.texture = sprite_get_texture(sprGreen, 0);

//box = instance_create_depth(200,61,200,oGameObject);
//box.scale = [.5,.5,.5]
//box.model = LoadOBJFile("JustACube.obj");
//box.texture = sprite_get_texture(spr_block, 0);


