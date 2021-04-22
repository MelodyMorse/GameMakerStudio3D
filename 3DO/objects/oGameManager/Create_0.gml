#macro WORLD_UNIT 128

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();

global.vFormat = vertex_format_end();
//room movement
instance_create_depth(0,0,0, objRoomManagerMovement);
//room1
/*
player = instance_create_depth(0, 0, 100, oPlayer);
cam = instance_create_depth(0,-10 * WORLD_UNIT,WORLD_UNIT, obj_camera);
player.model = LoadOBJFile("JustACube.obj");
player.texture = sprite_get_texture(spr_block, 0);
player.scale = [.75,.75,.75];
cam.target = player;
*/