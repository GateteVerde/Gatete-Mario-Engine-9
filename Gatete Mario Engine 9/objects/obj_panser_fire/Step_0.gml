/// @description Panser fireball logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//Gravity
yadd = 0.125;
if (yspeed > 4) {

	yspeed = 4;
}

//Destroy if outside the view
if (outside_view() == true)
&& (y > camera_get_view_y(view_camera[0]))
    instance_destroy();