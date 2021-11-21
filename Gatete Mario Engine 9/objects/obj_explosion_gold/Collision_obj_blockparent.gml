/// @description Bump blocks

if (other.ready == 0) {
	
	//If this is a brick
	if (other.object_index == obj_brick)
	|| (other.object_index == obj_brick_big) {
		
		with (other) event_user(2);
		exit;
	}
	
	//Set state to bumped
	other.ready = 1;
						
	//Set horizontal speed
	other.vspeed = -2;
	other.alarm[0] = 4;
						
	//Create block specific events
	with (other) event_user(0);
	with (other) event_user(1);
}