/// @description Yoshi Fire logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//Destroy when outside the view
if (outside_view() == true)
	instance_destroy();