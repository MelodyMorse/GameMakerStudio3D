var delta = delta_time * .000001;
//show_debug_message("acceleration add: " + string(acceleration * delta));

leftPressed = keyboard_check(vk_left);
rightPressed = keyboard_check(vk_right);


//show_debug_message("elapsed Time: " + string(elapsedTime));
//show_debug_message("delta time: " + string(delta_time));
#region first person controls
/*
//var mousePosX = 
look_dir -= (window_mouse_get_x() - window_get_width() /2) / sensitivity; 
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
#endregion

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
*/
#endregion
//show_debug_message("-topspeed: " + string(-topSpeed))
if(leftPressed)
{
	//add acceleration to speed every second until top
	//delta time 
	if(spd > -topSpeed)
	{
		//show_debug_message("code is here")		
		spd -= acceleration * delta * walkSpeed;
		
	}
	//x += spd;	
}
else if(rightPressed)
{
	if(spd < topSpeed)
	{
		spd += acceleration * delta * walkSpeed;
	}
	//x += spd;	

}
else
{
	
	if (abs(spd) < acceleration * delta) spd = 0;
	else if (sign(spd) == -1) spd += acceleration * delta;
	else if (sign(spd) == 1) spd -= acceleration * delta;
}	
x += spd;



