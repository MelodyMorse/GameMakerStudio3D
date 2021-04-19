/// @description Insert description here
// You can write your code in this editor
var t = matrix_build(x,y,depth, rot[0], rot[1], rot[2], scale[0], scale[1], scale[2]);
matrix_set(matrix_world, t);
if (model != noone)
{
	vertex_submit(model, pr_trianglelist, texture);
}
if(renderGizmo)
{
	vertex_submit(global.gizmo, pr_linelist, -1);		
}
matrix_set(matrix_world, matrix_build_identity());