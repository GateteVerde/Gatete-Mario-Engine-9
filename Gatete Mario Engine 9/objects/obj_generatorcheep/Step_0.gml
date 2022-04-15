/// @description Generator Cheep-Cheep logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//Gravity
yadd = 0.075;

//Cap vertical speed
if (yspeed > 4) {

    yspeed = 4;
    if (y > camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 32)
        instance_destroy();       
}

//Facing direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;
