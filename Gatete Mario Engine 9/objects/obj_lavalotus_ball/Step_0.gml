/// @description Lava Lotus fireball logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
}

//No gravity
yadd = 0;

//Destroy if outside the view
if (outside_view() == true)
	instance_destroy();
