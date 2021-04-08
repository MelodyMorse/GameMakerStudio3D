if (device_mouse_x_to_gui(0) >= upButtonX1 
	&& device_mouse_x_to_gui(0) <= upButtonX2
	&& device_mouse_y_to_gui(0) >= upButtonY1
	&& device_mouse_y_to_gui(0) <= upButtonY2)
{
	upButtonPressed = true;
}

if (device_mouse_x_to_gui(0) >= downButtonX1 
	&& device_mouse_x_to_gui(0) <= downButtonX2
	&& device_mouse_y_to_gui(0) >= downButtonY1
	&& device_mouse_y_to_gui(0) <= downButtonY2)
{
	downButtonPressed = true;
}
