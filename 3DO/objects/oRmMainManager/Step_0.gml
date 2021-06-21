if keyboard_check_pressed(vk_space)
{
	if (cam.active)
	{
		cam.active = false;
		cam.enableFPC = false;
		
		cam2.active = true;
		cam2.enableFPC = true;
		
	}
	else 
	{
		cam2.active = false;
		cam2.enableFPC = false;
		
		cam.active = true;
		cam.enableFPC = true;
		
	}
}