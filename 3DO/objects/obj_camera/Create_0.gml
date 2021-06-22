event_inherited();
enum CameraMode {
	Projection,
	Orthographic
}
active = false;
renderGrid = false;
renderWireFrameGrid = false;
renderGizmo = true;
enableFPC = false;
mode = CameraMode.Projection;
rot = [0,0,0];
forward = [0,0,1];
target = -1;
lookFrom = [x, y, depth];
lookAt = [0, 0, 0];
look_pitch = 0;
look_dir = 0;
vSensitivity = 10;
hSensitivity = 20;
moveSpeed = WORLD_UNIT;
gamepad_set_axis_deadzone(0, .1);

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);


grid = buffer_build_grid([0,0,0], [30, 30], WORLD_UNIT, make_color_hsv(140, 255 * 1, 255 * .5), make_color_hsv(140, 255 * 1, 255 * .6) );
wireGrid = buffer_build_wireframe_grid([0,0,0], [30, 30], WORLD_UNIT, c_black);

gizmo = buffer_build_gizmo([0,0,0]);
#region init skybox





bkg = vertex_create_buffer();
vertex_begin(bkg, global.vFormat);
AddVertexToBuffer(bkg, [400, 200, 700], [0, -1, 1], [0,0], c_red ); 
AddVertexToBuffer(bkg, [500, 200, 700], [0, -1, 1], [0,0], c_red );
AddVertexToBuffer(bkg, [500, 100, 700], [0, -1, 1], [0,0], c_red );
vertex_end(bkg);


//skybox = instance_create_depth(0,0,0,oGameObject);



skybox = LoadOBJFile("skybox.obj");
//skybox.scale = [1024,	1024, 1024];
//skybox.texture = sprite_get_texture(sInterstellarSkybox, 0);
#endregion


