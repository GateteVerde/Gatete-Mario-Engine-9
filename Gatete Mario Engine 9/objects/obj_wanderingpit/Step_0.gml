/// @description Ghost floor logic

//Manage pseudo movement variables
if (freeze == false) {
	
	x += xspeed;
}

//Turn on arrows
if (collision_rectangle(bbox_left-1, y, bbox_left, y+15, obj_right, 0, 0))
    xspeed = 1;
else if (collision_rectangle(bbox_right, y, bbox_right+1, y+15, obj_left, 0, 0))
    xspeed = -1;