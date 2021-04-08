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
		
		show_debug_message("verticies: ");
		for(var i = 0; i < ds_list_size(verticies); i++)
		{
				show_debug_message( string(ds_list_find_value(verticies, i)));
		}
		show_debug_message("uvs: ");
		for(var i = 0; i < ds_list_size(uvs); i++)
		{
				show_debug_message( string(ds_list_find_value(uvs, i)));
		}
		show_debug_message("normals: ");
		for(var i = 0; i < ds_list_size(normals); i++)
		{
				show_debug_message( string(ds_list_find_value(normals, i)));
		}
		
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
					show_debug_message("face: " + string(i) + " point: " + string(j));
					
					show_debug_message("vIndex: " + string(vIndex) );
					show_debug_message("vertex: " + string(vertex));
					//show_debug_message("uv: " + string(texturePoint));
					//show_debug_message("normal: " +string(n));
					
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

