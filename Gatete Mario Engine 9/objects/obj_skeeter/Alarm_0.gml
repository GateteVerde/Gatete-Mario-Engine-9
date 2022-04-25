/// @description Resume movement

//Allow slowdown
ready = 1;

//If there's a solid to the right
if (collision_line(bbox_right + 17, bbox_top+4, bbox_right + 17, bbox_bottom - 1, obj_solid, 0, 0))
	xspeed = round(random_range(-2, -4));

//Otherwise, if there's a solid to the left
else if (collision_line(bbox_left - 17, bbox_top+4, bbox_left - 17, bbox_bottom - 1, obj_solid, 0, 0))
	xspeed = round(random_range(2, 4));

//Otherwise
else
	xspeed = round(random_range(2, 4)) * sign(xscale);
