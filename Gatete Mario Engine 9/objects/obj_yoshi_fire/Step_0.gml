/// @description Yoshi Fire logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//If not moving up/down
if (yspeed == 0) {

    if (xspeed > 0)
        xspeed = 3;
    else if (xspeed < 0)
        xspeed = -3;
}
else {

    if (xspeed > 0)
        xspeed = 2.5;
    else if (xspeed < 0)
        xspeed = -2.5;
}

//Scale
xscale = 1*sign(xspeed);

//Destroy when outside the view
if (outside_view() == true)
	instance_destroy();