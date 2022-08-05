/// @description Stretch Boo logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//Set the facing direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;

//Turn towards ceiling
if (xspeed > 0) && (!collision_line(x+11, y-4, x+11, y-20, obj_boo_stretch_floor, 0, 0))
|| (xspeed < 0) && (!collision_line(x-12, y-4, x-12, y-20, obj_boo_stretch_floor, 0, 0))
    xspeed = -xspeed;
