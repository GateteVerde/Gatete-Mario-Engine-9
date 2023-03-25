/// @description Glider Balloon logic

//Set the vertical speed
vspeed -= 0.1;
if (vspeed < -4) {

	vspeed = -4;
	if (outside_view() == true)
		instance_destroy();
}