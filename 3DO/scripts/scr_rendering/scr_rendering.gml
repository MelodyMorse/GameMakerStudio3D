// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AddVertexToBuffer(buffer, position, normal, texcoord, color){
	vertex_position_3d(buffer, position[0], position[1], position[2]);
	vertex_normal(buffer, normal[0], normal[1], normal[2]);
	vertex_texcoord(buffer, texcoord[0], texcoord[1]);
	vertex_color(buffer, color, 1);
}
function LoadOBJFile(fileName)
{
	if(!file_exists(fileName))
	{
		show_debug_message("file " + fileName + " does not exist");
		return noone;
	}

	var vFormat = global.vFormat;
	//create buffer
	var vBuffer = vertex_create_buffer();
	
	//create lists
	var verticies = ds_list_create();
	var uvs = ds_list_create();
	var normals = ds_list_create();
	var faces = ds_list_create();
	var file = file_text_open_read(fileName);
		
		//get instructions
		while(!file_text_eof(file))
		{
			var str = file_text_read_string(file);
			
			var ins = SplitString(str, " ")[0];

			switch (ins)
			{
				case "v":
					ds_list_add( verticies, ReadVerticies(str));
					break;
				case "vt":
					ds_list_add(uvs, ReadUVs(str));
					break;
				case "vn":
					ds_list_add(normals, ReadNormal(str));
					break;
				case "f":
					ds_list_add(faces, ReadFaces(str))
					break;
				
			}
			file_text_readln(file);
		}
		//close file
		file_text_close(file);
		
		
		vertex_begin(vBuffer, vFormat);
		for(var i = 0; i <  ds_list_size(faces); i++)
		{
				var face = ds_list_find_value(faces, i);
				for(var j = 0; j < array_length(face); j++)
				{
					var vIndex = face[j, 0] - 1;
					var tIndex = face[j, 1] - 1;
					var nIndex = face[j, 2] - 1;
				
					var vertex = ds_list_find_value(verticies, vIndex);
					vertex[0] *= WORLD_UNIT;
					vertex[1] *= WORLD_UNIT;
					vertex[2] *= WORLD_UNIT;
					
					var texturePoint = ds_list_find_value(uvs, tIndex);
					//mirror x coord (I don't know why I need to do this)
					//texturePoint[0] = 1 - texturePoint[0];
					texturePoint[1] = 1 - texturePoint[1];
					var n = ds_list_find_value(normals, nIndex);
					
					AddVertexToBuffer(vBuffer, vertex, n,	texturePoint,	c_white);
				}
				
		}
		//clean up
		
		vertex_end(vBuffer);
		ds_list_destroy(verticies);
		ds_list_destroy(uvs);
		ds_list_destroy(normals);
		ds_list_destroy(faces);
		
		return vBuffer;
}
function ReadVerticies(str)
{
	var arrString = SplitString(str, " ");
	var arrReal = StringArrayToReal(arrString, 3, 1);

	return arrReal;
}

function ReadNormal(str)
{
	var arrString = SplitString(str, " ");
	var arrReal = StringArrayToReal(arrString, 3, 1);

	return arrReal;
}
function ReadUVs(str)
{
	var arrStr = SplitString(str, " ");
	var arrReal = StringArrayToReal(arrStr, 2, 1);
	return arrReal;
}

function ReadFaces(str)
{
	var arrStr = SplitString(str, " ");
	var arrFace;
	for(var i = 0; i < array_length(arrStr) - 1; i++)
	{
		arrFace[i] = ReadFaceCoord(arrStr[i + 1]);
	}
	return arrFace;
}

function ReadFaceCoord(str)
{
	var arrStr = SplitString(str, "/");
	var arrReal = StringArrayToReal(arrStr, 3, 0);
	return arrReal;
	
}

function StringArrayToReal(strArr, newArrayLength, offset)
{
	var realArr;
	for(var i = 0; i < newArrayLength; i++)
	{
		realArr[i] = real(strArr[i + offset]);	
	}
	
	
	return realArr;
}

function buffer_build_grid(origin, dimensions, size,col1, col2)
{
	grid = vertex_create_buffer();
	vertex_begin(grid, global.vFormat);
	//calculate width
	var w = dimensions[0] * size;
	var xStart = origin[0] - w * 0.5;
	var l = dimensions[1] * size;
	var zStart = origin[2] - l * 0.5;
	
	var numX = dimensions[0];
	var numZ = dimensions[1];

	for (var i = 0; i < numX; i++)
	{
	
		for (var j = 0; j < numZ; j++)
		{
			var c = col1;
			if (j  % 2 ==  i  % 2) {c = col2;} 
		
			AddVertexToBuffer(grid, [xStart + i*size,zStart + j*size,0 ], [0,-1,0], [0,0], c);
			AddVertexToBuffer(grid, [xStart + i * size,zStart + size+ j*size,0], [0,-1,0], [0,0], c);
			AddVertexToBuffer(grid, [xStart + size + i* size,zStart + size+ j*size,0], [0,-1,0], [0,0], c);

			AddVertexToBuffer(grid, [xStart + i* size,zStart+ j*size,0], [0,-1,0], [0,0], c);
			AddVertexToBuffer(grid, [xStart + size+ i* size,zStart + size+ j*size,0], [0,-1,0], [0,0], c);
			AddVertexToBuffer(grid, [xStart + size+ i* size,zStart+ j*size,0], [0,-1,0], [0,0], c);
		}
	}
	vertex_end(grid);
	return grid;
}

function buffer_build_wireframe_grid(origin, dimensions, size, col)
{
	var w = dimensions[0] * size;
	var xStart = origin[0] - w * 0.5;
	var l = dimensions[1] * size;
	var zStart = origin[2] - l * 0.5;
	
	//var numX = dimensions[0];
	//var numZ = dimensions[1];
	
	
	var grid = vertex_create_buffer();
	vertex_begin(grid, global.vFormat);
	//AddVertexToBuffer(grid, [xStart, origin[1], origin[2]], [0,1, 0], [0,0], col  );
	//	AddVertexToBuffer(grid, [xStart + , origin[1], origin[2]],[0,1,0] , [0,0], col  );
	//x
	for(var i = 0; i <= dimensions[0]; i++)
	{
		AddVertexToBuffer(grid, [xStart, zStart + size * i, origin[1] ], [0,0, 1], [0,0], col  );
		AddVertexToBuffer(grid, [xStart + w, zStart + size * i, origin[1]],[0,1,0] , [0,0], col  );
	}
	//y
	for(var i = 0; i <= dimensions[1]; i++)
	{
			AddVertexToBuffer(grid, [xStart + size * i, zStart, origin[1]], [0,0, 1], [0,0], col  );
			AddVertexToBuffer(grid, [xStart + size * i, zStart + l, origin[1]],[0,1,0] , [0,0], col  );
	}
	
	show_debug_message("buffer: " + string(grid));
	//AddVertexToBuffer(grid, [0, 0, 0], [0,0, 1], [0,0], col  );
			//AddVertexToBuffer(grid, [120, 0, 120],[0,1,0] , [0,0], col  );
	
	//AddVertexToBuffer(grid, [origin[0], origin[1], zStart], [0,1,0], [0,0], col  );
	//AddVertexToBuffer(grid, [origin[0], origin[1], zStart + l],[0,1,0] , [0,0], col  );
	
	vertex_end(grid);
	return grid;
}
function buffer_build_gizmo(origin)
{
	var lines = vertex_create_buffer();
	vertex_begin(lines, global.vFormat);
	//z axis
	AddVertexToBuffer(lines, origin,				[0, 0, 1],	[0,0],	c_blue);
	AddVertexToBuffer(lines, [origin[0], origin[1], origin[2] + WORLD_UNIT],			[0, 0, 1],	[0,0],	c_blue);
	//x axis
	AddVertexToBuffer(lines, origin,				[0, 0, 1],	[0,0],	c_red);
	AddVertexToBuffer(lines, [origin[0] + WORLD_UNIT, origin[1], origin[2]],			[0, 0, 1],	[0,0],	c_red);

	//y axis
	AddVertexToBuffer(lines, origin,				[0, 0, 1],	[0,0],	c_green);
	AddVertexToBuffer(lines, [origin[0], origin[1] + WORLD_UNIT, origin[2]],			[0, 0, 1],	[0,0],	c_green);

	vertex_end(lines)
	return lines;

}
