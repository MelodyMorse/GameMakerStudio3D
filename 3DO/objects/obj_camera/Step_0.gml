forward =	[sin(degtorad(rot[1])) * cos(degtorad(rot[0])),
				sin(degtorad(-rot[0])),
				cos(degtorad(rot[0])) * cos(degtorad(rot[1])) ]
				
if (enableFPC)
{
	//movement inputs
var rhaxis = gamepad_axis_value(0, gp_axisrh); 
var rvaxis = gamepad_axis_value(0, gp_axisrv);
var lvaxis = gamepad_axis_value(0, gp_axislv);
var lhaxis = gamepad_axis_value(0, gp_axislh);
look_dir += rhaxis * delta_time *.000001 * hSensitivity;
look_pitch += rvaxis * delta_time *.000001 * vSensitivity;
look_pitch = clamp(look_pitch, -80, 80);
x -= dcos(look_dir) * lvaxis * moveSpeed * delta_time *.000001;
y += dsin(look_dir) * lvaxis * moveSpeed * delta_time *.000001;
x -= dsin(look_dir) * lhaxis * moveSpeed * delta_time *.000001;
y -= dcos(look_dir) * lhaxis * moveSpeed * delta_time *.000001;



lookFrom = [x, y, depth];
lookAt[0] = lookFrom[0] + dcos(look_dir);
lookAt[1] = lookFrom[1] - dsin(look_dir);
lookAt[2] = lookFrom[2] - dsin(look_pitch);
//var leftButton = gamepad_button_check(0, gp_padl);
//var rightButton = gamepad_button_check(0, gp_padr);


//var upButton = gamepad_button_check(0, gp_padu);
//var downButton = gamepad_button_check(0, gp_padd);
}

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
*/
#endregion
