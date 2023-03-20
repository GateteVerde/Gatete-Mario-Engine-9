/// @description Chikako Logic

//Handle pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//Set y position
yspeed += (y > ystart) ? -0.05 : 0.05;

//Face towards the player
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
	xscale = -1;
else
	xscale = 1;
