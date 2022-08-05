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

//Turn towards ledges
if (xspeed > 0) && (!collision_line(x+11, bbox_bottom-1, x+11, bbox_bottom+15, obj_boo_stretch_floor, 0, 0))
|| (xspeed < 0) && (!collision_line(x-12, bbox_bottom-1, x-12, bbox_bottom+15, obj_boo_stretch_floor, 0, 0))
    xspeed = -xspeed;
