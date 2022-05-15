/// @description Rinka logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
}

//Destroy if outside
if (outside_view() == true)
	instance_destroy();
