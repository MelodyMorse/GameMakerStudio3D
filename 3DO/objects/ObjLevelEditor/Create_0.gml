vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertex_format_add_color();

global.vFormat = vertex_format_end();


show_debug_message("Inside level editor");
cam = instance_create_depth(0,300,0, obj_camera);
