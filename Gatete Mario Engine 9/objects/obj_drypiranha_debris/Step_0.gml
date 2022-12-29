/// @description Debris logic

//Set angle
angle += 10 * sign(hspeed);

//Gravity
if (vspeed > 4) {
	
	vspeed = 4;
	gravity = 0;
}

//Destroy when outside
if (outside_view() == true)
	instance_destroy();