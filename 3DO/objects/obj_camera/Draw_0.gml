
#region camera update

draw_clear(c_ltgrey);
var camera = camera_get_active();
//static cam
var lookFrom = [x,y, depth]; 
lookAt = [600, 129, 500] 
//fps cam
/*if(target != -1)
{
	lookFrom[0] = target.x;
	lookFrom[1] = target.y;
	lookFrom[2] = target.depth;

	lookAt[0] = target.x + dcos(target.look_dir);
	lookAt[1] = target.y - dsin(target.look_pitch);
	lookAt[2] = target.depth - dsin(target.look_dir);
}*/
var camUp = [0, -1, 0];

var fpLookAt = matrix_build_lookat(lookFrom[0], lookFrom[1], lookFrom[2], lookAt[0], lookAt[1], lookAt[2], camUp[0], camUp[1], camUp[2]);
//var viewMatrix = 
var projMatrixOrtho = matrix_build_projection_ortho(1280, 720, 1, 1000000);
var projMatrix = matrix_build_projection_perspective_fov(60, window_get_width()/ window_get_height(), 1, 32000 );
camera_set_view_mat(camera, fpLookAt);
camera_set_proj_mat(camera, projMatrix );
camera_apply(camera);
#endregion

#region render skybox
/*
gpu_set_zwriteenable(false);
matrix_set(matrix_world, matrix_build(pos[0], pos[1], pos[2], 0,0,0, 100, 100, 100));
vertex_submit(skybox, pr_trianglelist,sprite_get_texture(sInterstellarSkybox, 0));
//vertex_submit(bkg, pr_trianglelist, -1);
matrix_set(matrix_world, matrix_build_identity());
gpu_set_zwriteenable(true);
*/
#endregion


#region render game objects
vertex_submit(grid, pr_trianglelist, -1);

with(oGameObject) 
{
	event_perform(ev_draw, 0);
}

#endregion