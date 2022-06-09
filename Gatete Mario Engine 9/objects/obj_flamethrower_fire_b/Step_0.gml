/// @description Flamethrower Fire logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//Gravity
yadd = 0.2;

//Destroy if outside the view
if (outside_view() == true)
	instance_destroy();