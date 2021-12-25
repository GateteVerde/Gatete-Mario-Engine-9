/// @description Manage tide movement

//If not moving
if (vspeed == 0) {

	//If there's a up arrow modifier
	if (collision_rectangle(bbox_left, y, bbox_right, y+15, obj_up, 0, 0))
		vspeed = -0.25;
		
	//Otherwise, if there's a down arrow modifier
	else if (collision_rectangle(bbox_left, y, bbox_right, y+15, obj_down, 0, 0))
		vspeed = 0.25;
}