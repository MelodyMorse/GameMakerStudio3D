if(mouse_wheel_up())
{
	cam.x += cam.forward[0] * zoomSpd;
	cam.y += cam.forward[2] * zoomSpd;
	cam.depth += cam.forward[1] * zoomSpd;
}
if(mouse_wheel_down())
{
	cam.x -= cam.forward[0] * zoomSpd;
	cam.depth -= cam.forward[1] * zoomSpd;
	cam.y -= cam.forward[2] * zoomSpd;	
}