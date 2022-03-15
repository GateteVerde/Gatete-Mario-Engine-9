/// @description Blue Parakoopa logic

//If not frozen
if (freeze == false) {

	//Handle parakoopa position
	x = xstart+40*cos(angle*pi/180);
	y = ystart+40*sin(angle*pi/180);

	//Disc angle
	angle += 1*sign(dir);
	if (angle > 360)
	    angle -= 360;
}

//Set facing direction
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xscale = -1;
else
	xscale = 1;