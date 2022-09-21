/// @description Hammer logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
	
	if (yspeed > 4)
		yspeed = 4;
}

//Gravity
yadd = 0.125;

//Destroy when outside the view
if (y > room_height+32)
	instance_destroy();