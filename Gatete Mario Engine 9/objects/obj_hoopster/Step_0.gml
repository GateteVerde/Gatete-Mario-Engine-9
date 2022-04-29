/// @description Hoopster logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

#region LOGIC

	//Set maximum speed
	if (instance_exists(obj_mario)) {
	
		if (obj_mario.x > bbox_left - 8)
		&& (obj_mario.x < bbox_right + 8)
			fast = 1;
		else
			fast = 0;
	}
	
	//Set vertical speed
	yspeed = ((fast) ? 0.75 : 0.5) * dir;
	
	//Turn around when there's not a climbable surface in the direction they are moving at.
	if (yspeed < 0) && (!collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_top, obj_climb, 0, 0))
	|| (yspeed > 0) && (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_climb, 0, 0))
		dir = -dir;

#endregion

//Facing direction
if (yspeed < 0)
	yscale = -1;
else if (yspeed > 0)
	yscale = 1;
