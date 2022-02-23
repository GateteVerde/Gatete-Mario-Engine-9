/// @description Ledge turn script

//If the enemy can't turn on ledges, exit this event.
if (turn_on_ledges == false)
exit;

//If there's no gravity
if (yadd == 0) {

	//If there's not a slope in position
	if (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+15, obj_slopeparent, 1, 0)) {
	
		//If the NPC is moving and there's not a semisolid on the way
		if ((xspeed < 0) && (!collision_rectangle(bbox_left+3, bbox_bottom-1, bbox_left+3, bbox_bottom+15, obj_semisolid, 0, 0)))
		|| ((xspeed > 0) && (!collision_rectangle(bbox_right-3, bbox_bottom-1, bbox_right-3, bbox_bottom+15, obj_semisolid, 0, 0)))
			xspeed = -xspeed;
	}
	
	//Otherwise
	else {
	
		//If the NPC is moving and there's not a semisolid on the way
		if ((xspeed < 0) && (!collision_rectangle(bbox_left+3, bbox_bottom-1, bbox_left+3, bbox_bottom+15, obj_slopeparent, 1, 0)))
		|| ((xspeed > 0) && (!collision_rectangle(bbox_right-3, bbox_bottom-1, bbox_right-3, bbox_bottom+15, obj_slopeparent, 1, 0)))
			xspeed = -xspeed;		
	}
}