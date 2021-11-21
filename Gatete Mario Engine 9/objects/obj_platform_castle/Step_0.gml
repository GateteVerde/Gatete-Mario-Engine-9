/// @description Make the platform go upwards

//If not moving
if (ready == 0) {

	//Check for the player
	var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

	//If the player exists
	if (mario)
	&& (mario.state != playerstate.jump)
	&& (mario.bbox_bottom < yprevious+5) {
	
		//Begin movement
		ready = 1;
		
		//Set vertical speed
		vspeed = -2;
		
		//Make it visible
		if (visible == false)
			visible = true;
	}
}

//Otherwise
else if (ready > 0) {

	//If the platform reached the start position, stop it
	if (ready == 1) && (y < ystart) {
	
		//Stop vertical speed
		vspeed = 0;
		y = ystart;
		
		//Set up respawn state
		ready = 2;
		alarm[0] = 1;
	}
}