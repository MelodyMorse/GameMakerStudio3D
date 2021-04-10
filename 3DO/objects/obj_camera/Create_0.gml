target = -1;
lookAt = [0, 0, 0];
look_pitch = 0;
look_dir = 0;
sensitivity = 10;
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

#region setup grid
grid = vertex_create_buffer();
vertex_begin(grid, global.vFormat);
var xStart = 0;
var zStart = 0;
var size = 120;
var numX = 10;
var numZ = 10;

for (var i = 0; i < numX; i++)
{
	
	for (var j = 0; j < numZ; j++)
	{
		var col = c_white;
		if (j  % 2 ==  i  % 2) {col = c_blue;} 
		
		AddVertexToBuffer(grid, [xStart + i*size,0,zStart + j*size ], [0,-1,0], [0,0], col);
		AddVertexToBuffer(grid, [xStart + i * size,0,zStart + size+ j*size], [0,-1,0], [0,0], col);
		AddVertexToBuffer(grid, [xStart + size + i* size,0,zStart + size+ j*size], [0,-1,0], [0,0], col);

		AddVertexToBuffer(grid, [xStart + i* size,0,zStart+ j*size], [0,-1,0], [0,0], col);
		AddVertexToBuffer(grid, [xStart + size+ i* size,0,zStart + size+ j*size], [0,-1,0], [0,0], col);
		AddVertexToBuffer(grid, [xStart + size+ i* size,0,zStart+ j*size], [0,-1,0], [0,0], col);
	}
}
vertex_end(grid);
#endregion
#region setup axes
lines = vertex_create_buffer();
vertex_begin(lines, global.vFormat);
//z axis
AddVertexToBuffer(lines, [0, 0, 0],				[0, 0, 1],	[0,0],	c_blue);
AddVertexToBuffer(lines, [0, 0, 100],			[0, 0, 1],	[0,0],	c_blue);
//x axis
AddVertexToBuffer(lines, [0, 0, 0],				[0, 0, 1],	[0,0],	c_red);
AddVertexToBuffer(lines, [100, 0, 0],			[0, 0, 1],	[0,0],	c_red);

//y axis
AddVertexToBuffer(lines, [0, 0, 0],				[0, 0, 1],	[0,0],	c_green);
AddVertexToBuffer(lines, [0, 100, 0],			[0, 0, 1],	[0,0],	c_green);

vertex_end(lines)
#endregion
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


