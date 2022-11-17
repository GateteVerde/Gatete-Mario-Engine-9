/// @description Motion

//Set angle
image_angle += 20 * sign(hspeed)*-1;

//Set gravity
if (vspeed > 4) {

	vspeed = 4;
	gravity = 0;
}

//Destroy when outside the view
if (y > room_height + 320)
	instance_destroy();