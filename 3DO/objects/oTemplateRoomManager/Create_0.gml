cam = instance_create_depth(0,-10 * WORLD_UNIT,WORLD_UNIT * 0, obj_camera);
show_debug_message("room loaded");
cam.renderWireFrameGrid = true;