/// @description Break blocks if Mario is giant or bump blocks if you groundpound them

//Check for Mario
if (instance_exists(obj_mario)) {

	//Check for Mario
	if (collision_rectangle(bbox_left-4, bbox_top-4, bbox_right+4, bbox_bottom+6, obj_mario, 0, 0))
	&& (global.powerup == cs_mega)
	&& (instance_exists(obj_megashroom_timer)) {
	
		event_user(15);
		if (sprite_index == spr_qblock_big) 
		|| (sprite_index == spr_brick_big) 
		|| (sprite_index == spr_flipblock_big) 
		|| (sprite_index == spr_coinrouletteblock)
			obj_mario.xspeed /= 4
	}

	//If Mario is tiny or small
	if (global.powerup == cs_tiny)
		exit;
		
	//Otherwise
	else if (obj_mario.yspeed > 0)
	&& (place_meeting(x, y - obj_mario.yspeed * 2.5, obj_mario)) {
		
		//If Mario is doing a ground pound
		if (obj_mario.groundpound == 2) 
		|| ((global.powerup == cs_propeller) && (obj_mario.jumpstyle == 1)) {
			
			//If this block is a breakable block
			if (object_index == obj_brick)
			|| (object_index == obj_brick_big) {
				
				//If Mario is small, bump the block instead
				if (global.powerup == cs_small) {
				
					//Make items sprout from below
					bottom = true;
				
					//Bump it
					ready = 1;
				
					//Bump block downwards
					vspeed = 2;
					alarm[0] = 4;
					
					//Perform block events
					event_user(0);					
				}
				
				else
					event_user(15);
			}
				
			//Otherwise
			else {
			
				//If not bumped
				if (ready == 0) {
				
					//Make items sprout from below
					bottom = true;
				
					//Bump it
					ready = 1;
				
					//Bump block downwards
					vspeed = 2;
					alarm[0] = 4;
					
					//Perform block events
					event_user(0);
				}
			}
		}
	}
}