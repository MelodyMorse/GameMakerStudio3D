vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();

global.vFormat = vertex_format_end();
global.gizmo = RenderGizmo([0,0,0]);

zoomSpd = WORLD_UNIT * .25;

show_debug_message("Inside level editor");
cam = instance_create_depth(0,-10 * WORLD_UNIT,WORLD_UNIT, obj_camera);
player = instance_create_depth(0,0,129, oPlayer);
//player.model = LoadOBJFile("JustACube.obj");
//player.texture = sprite_get_texture(spr_block, 0);
player.renderGizmo = true;
player.scale = [.75,.75,.75];