/// @description Spiked Cannonball logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//Gravity
yadd = 0.1;

//Destroy when outside the view
if (y > room_height+32)
	instance_destroy();