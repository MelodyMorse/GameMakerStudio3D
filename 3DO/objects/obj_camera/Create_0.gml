enum CameraMode {
	Projection,
	Orthographic
}
renderGrid = false;
renderWireFrameGrid = false;
renderGizmo = true;
mode = CameraMode.Projection;
rot = [0,0,0];
forward = [0,0,1];
target = -1;
lookAt = [0, 0, 0];
look_pitch = 0;
look_dir = 0;
sensitivity = 10;

gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);


grid = RenderGrid([0,0,0], [30, 30], 120, make_color_hsv(140, 255 * 1, 255 * .5), make_color_hsv(140, 255 * 1, 255 * .6) );
grid2 = RenderWireframeGrid([0,0,120], [30, 30], 120, c_black);

lines = RenderGizmo([0,0,0]);
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


