cam = instance_create_depth(0,-10 * WORLD_UNIT,WORLD_UNIT * 0, obj_camera);
show_debug_message("room loaded");
cam.renderGrid = true;

cam.grid = buffer_build_grid_vertical([0,0,WORLD_UNIT * 2], [5,10], WORLD_UNIT, c_white, c_ltgray);
