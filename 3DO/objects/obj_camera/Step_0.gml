//var mousePosX = 
//look_dir -= (window_mouse_get_x() - window_get_width() /2) / sensitivity; 
// look_pitch -= (window_mouse_get_y() - window_get_height() /2)/ sensitivity; 
//look_pitch = clamp(look_pitch, -80, 80);
//lookAt[0] = pos[0] + dcos(look_dir);
//lookAt[1] = pos[1] - dsin(look_pitch);

//lookAt[2] = pos[2] - dsin(look_dir);
//lock mouse to center of window
//window_mouse_set(window_get_width() /2, window_get_height()/ 2 );

//emergency stop
//if(keyboard_check_direct(vk_escape) ) game_end();

if(keyboard_check(vk_up))
{
	x += dcos(lookDir) * walkSpeed;
	depth -= dsin(lookDir) * walkSpeed;
}