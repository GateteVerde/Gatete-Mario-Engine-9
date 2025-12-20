/// @description Collision with Mario

//If the switch has not been pressed yet
if (sprite_index == spr_eswitch) {

	//If this switch is not on the ceiling
	if (ceiling = 1) {
		
		//Check for Mario
		var mario = collision_rectangle(bbox_left, bbox_top-2, bbox_right, bbox_top+2, obj_mario, 0, 0);
		
		//If Mario does exist and it's vertical speed is greater or equal to 0, push the switch
		if (mario)
		&& (mario.yspeed >= 0)
	        event_user(0);	
	}
	
	//Otherwise
	else if (ceiling == -1) {
	
		var mario2 = collision_rectangle(bbox_left, bbox_bottom-2, bbox_right, bbox_bottom+4, obj_mario, 0, 0);
		
		//If Mario does exist and it's vertical speed is lower than 0, push the switch
		if (mario2)
		&& (mario2.yspeed < 0)
			event_user(0);
	}
}