/// @description Ledge turn script

//If the enemy can't turn on ledges, exit this event.
if (turn_on_ledges == false)
exit;

//If the enemy is on the ground
if (yspeed == 0) {

	//If moving left
	if (xspeed < 0) {
	
		//If there's no collision to the left, turn around
		if (!collision_rectangle(bbox_left, bbox_bottom - 1, bbox_left, bbox_bottom + 4, obj_semisolid, 0, 0))
		&& (!collision_rectangle(bbox_left, bbox_bottom, bbox_left, bbox_bottom + 15, obj_slopeparent, 1, 0))
			xspeed = -xspeed;
	}
	
	//Otherwise, if moving right
	else if (xspeed > 0) {
	
		//If there's no collision to the left, turn around
		if (!collision_rectangle(bbox_right, bbox_bottom - 1, bbox_right, bbox_bottom + 4, obj_semisolid, 0, 0))
		&& (!collision_rectangle(bbox_right, bbox_bottom, bbox_right, bbox_bottom + 15, obj_slopeparent, 1, 0))
			xspeed = -xspeed;	
	}
}