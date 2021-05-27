var pos = [position.x, position.y];
var sPos = WorldToScreenVector(pos);
x = sPos[0];
y = sPos[1];
var delta = delta_time * .000001;
fallRateMeters = -.25 /60;
delay++;

position = new Vector3(position.x, position.y + fallRateMeters, position.z); 
//position = new Vector3(0,0,0);

if(keyboard_check_pressed(vk_space))
{
	show_debug_message("space");
	//add velocity 
}