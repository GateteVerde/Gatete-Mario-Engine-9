/// @description Bullet Bill logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//Destroy when outside
if (outside_view() == true)
	instance_destroy();
