/// @description Red Hoopster logic

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
	if (yspeed < 0) {
		
		//Check for Mario
		var mario = collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_top-1, obj_mario, 0, 0);
		
		//If Mario is above this enemy and Mario is in contact with a solid block...
		if (mario)
		&& (collision_rectangle(mario.bbox_left, mario.bbox_top-1, mario.bbox_right, mario.bbox_top-1, obj_solid, 0, 0))
		
		//...or there's no climbable surface on the way
		|| (!collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_top, obj_climb, 0, 0))
			dir = -dir;
	}
	else if ((yspeed > 0) && (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_climb, 0, 0)))
		dir = -dir;

#endregion

//Facing direction
if (yspeed < 0)
	yscale = -1;
else if (yspeed > 0)
	yscale = 1;
