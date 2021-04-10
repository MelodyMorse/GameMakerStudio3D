

#region first person controls
if(firstPersonContolsActive)
{
	//var mousePosX = 
	look_dir -= (window_mouse_get_x() - window_get_width() /2)/ sensitivity; 
	look_pitch -= (window_mouse_get_y() - window_get_height() /2)/ sensitivity; 
	look_pitch = clamp(look_pitch, -80, 80);
	//lookAt[0] = pos[0] + dcos(look_dir);
	//lookAt[1] = pos[1] - dsin(look_pitch);

	//lookAt[2] = pos[2] - dsin(look_dir);
	//lock mouse to center of window
	window_mouse_set(window_get_width() /2, window_get_height()/ 2 );

	//emergency stop
	if(keyboard_check_direct(vk_escape) ) game_end();

	if(keyboard_check(vk_up))
	{
		x += dcos(look_dir) * walkSpeed;
		depth -= dsin(look_dir) * walkSpeed;
	}

	if(keyboard_check(vk_down))
	{
		x-= dcos(look_dir) * walkSpeed;
		depth += dsin(look_dir) * walkSpeed;
	}

	if(keyboard_check(vk_right))
	{
		x += dsin(look_dir) * walkSpeed;
		depth += dcos(look_dir) * walkSpeed;
	}

	if keyboard_check(vk_left)
	{
		x -= dsin(look_dir) * walkSpeed;
		depth -= dcos(look_dir) * walkSpeed;
	}
}
#endregion
//show_debug_message("-topspeed: " + string(-topSpeed))
if(keyboard_check(vk_left))
{
	//add acceleration to speed every second until top
	//delta time 
	if(spd > -topSpeed)
	{
		//show_debug_message("code is here")		
		spd -= acceleration * .02;
	}
	//x += spd;	
}
else if(keyboard_check(vk_right))
{
	if(spd < topSpeed)
	{
		spd += acceleration * .02
	}
	//x += spd;	
}
else
{
	if (sign(spd) == -1) spd += acceleration * .02;
	else if (sign(spd) == 1) spd -= acceleration * .02;
	if (abs(spd) < .001) spd = 0;
}
x += spd;