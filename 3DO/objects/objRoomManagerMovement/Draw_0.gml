if (render == gridRender.axies || render == gridRender.both)
{
	draw_set_color(c_yellow);
	draw_line(0, room_height / 2, room_width, room_height /2);
	draw_line(room_width/ 2, 0, room_width / 2, room_height);
	draw_set_color(c_white);
}
if (render == gridRender.both)
{
	//horizontal lines above origin


	for(var i = global.unit; i < room_height / 2; i+= global.unit)
	{
		if(i % (global.unit * 2) == 0) draw_set_color(c_white);
		else draw_set_color(c_grey);
		var yy = (room_height / 2) - i 
		draw_line(0, yy, room_width, yy);
	
	}
	//horizontal lines below origin
	for(var i = global.unit; i < room_height / 2; i+= global.unit)
	{
		if(i % (global.unit * 2) == 0) draw_set_color(c_white);
		else draw_set_color(c_grey);
		var yy = (room_height / 2) + i 
		draw_line(0, yy, room_width, yy);
	
	}
	//Vertical lines left
	for(var i =  global.unit; i < room_width / 2; i += global.unit)
	{
		if(i % (global.unit * 2) == 0) draw_set_color(c_white);
		else draw_set_color(c_grey);
		var xx = (room_width / 2) - i 
		draw_line(xx, 0, xx, room_height);
	}
	//Vertical lines right
	for(var i = global.unit; i < room_width / 2; i += global.unit)
	{
		if(i % (global.unit * 2) == 0) draw_set_color(c_white);
		else draw_set_color(c_grey);
		var xx = (room_width / 2) + i 
		draw_line(xx, 0, xx, room_height);
	}
}