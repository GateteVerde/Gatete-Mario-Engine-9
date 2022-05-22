/// @description Dry Bones bone logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
}

//No gravity
yadd = 0;

//Destroy when outside the view
if (outside_view() == true)
	instance_destroy();
