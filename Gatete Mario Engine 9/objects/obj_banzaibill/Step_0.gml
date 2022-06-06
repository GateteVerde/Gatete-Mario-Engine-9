/// @description Bullet Bill logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//Set depth
if (depth != -3) {

	if (!place_meeting(x, y, obj_blaster_banzai))
		depth = -3;
}

//Destroy when outside
if (outside_view() == true)
	instance_destroy();
