/// @description Ghost floor logic

//Manage pseudo movement variables
if (freeze == false) {
	
	x += xspeed;
}

//Turn on arrows
if (collision_rectangle(x-1, y, x, y+15, obj_right, 0, 0))
    xspeed = 1;
else if (collision_rectangle(x+33, y, x, y+15, obj_left, 0, 0))
    xspeed = -1;
