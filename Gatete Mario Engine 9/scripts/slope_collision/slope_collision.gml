/// @function slope_collision();

function slope_collision() {
	
	//Embed Mario/NPCs into the slope if he is walking to ensure correct slope mechanics
	if (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+5, obj_slopeparent, 1, 0))
	&& (!collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom-5, obj_slopeparent, 1, 0)) 
	&& (yspeed == 0) 
		y += 4;

	//Handle slope collisions
	if (collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom, obj_slopeparent, 1, 0))
	&& (!collision_rectangle(bbox_left, bbox_bottom-8, bbox_right, bbox_bottom-8, obj_slopeparent, 1, 0)) {
						
		//If the bounces variable does exist, make NPCs bounce
		if (variable_instance_exists(object_index, "bounces")) {
	
			//If moving down
			if (yspeed > 0) {
	
				//If this object cannot bounce
				if (bounces == -1) {
									
					yadd = 0;
					yspeed = 0;
				}
		
				//Otherwise, if it can bounce
				else if (bounces != -1) {

					bounces--;
					if (bounces == 0) {
										
						yadd = 0;
						yspeed = 0;
					}
					else
						yspeed = -yspeed/2;
				}
			}
		}
		
		//Otherwise
		else {
		
			//If moving down
			if (yspeed > 0) {
			
				//Stop vertical speed
				yadd = 0;
				yspeed = 0;
				
				//Reset variables
				event_user(15);
			}
		}
		
		//Prevent Mario from getting embed on a slope
		if (object_index == obj_mario) {
			
			if (yspeed > -0.85) {
				
				//Round position variables
				y = round(y);
				
				//Prevent getting embed on a slope
				while (collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom, obj_slopeparent, 1, 0))
					y--;
			}
		}
		
		//Otherwise, if this is a NPC
		else {
			
			//Round position variables
			y = round(y);
			
			//Prevent getting embed on a slope
			while (collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom, obj_slopeparent, 1, 0))
				y--;	
		}
	}
}