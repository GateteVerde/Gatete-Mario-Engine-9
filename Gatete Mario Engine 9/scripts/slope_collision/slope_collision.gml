function slope_collision() 
{
	with (obj_slopeparent) {
		
		var adj = point_distance(x, y, other.x, y);
		var opp = dtan(-angle) * adj;
		var yy = y - opp
		
		if (other.y < yy) {

			with (other) {

				//If there's a slope and Mario is above this slope, start checking
				if (collision_rectangle(x-1, bbox_bottom, x+1, bbox_bottom+5, obj_slopeparent, 1, 0))
				&& (bbox_bottom <= (collision_rectangle(x-1, bbox_bottom, x+1, bbox_bottom+5, obj_slopeparent, 1, 0).bbox_bottom)) {
	
					//Embed Mario into the slope if he is walking to ensure correct slope mechanics
					if (collision_rectangle(x-1, bbox_bottom, x+1, bbox_bottom+5, obj_slopeparent, 1, 0))
					&& (!collision_rectangle(x-1, bbox_bottom-5, x+1, bbox_bottom-5, obj_slopeparent, 1, 0))
					&& (yadd == 0)
						y += 4;

					//Handle slope collisions
					if (collision_rectangle(x-1, bbox_bottom-5, x+1, bbox_bottom, obj_slopeparent, 1, 0))
					&& (!collision_rectangle(x-1, bbox_bottom-10, x+1, bbox_bottom-10, obj_slopeparent, 1, 0)) {
						
						//If the bounces variable does exist, make the object bounce
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

							//If Mario/NPCs is moving down onto a slope
							if (yspeed > 0) {

								//Stop vertical movement
								yadd = 0;
								yspeed = 0;

								//Reset variables
								event_user(15);
							}
						}
					}
	
					//Prevent Mario/NPCs from getting embed inside a slope
					if (yspeed > -0.85)
						while (collision_rectangle(x-1, bbox_bottom-5, x+1, bbox_bottom, obj_slopeparent, 1, 0))
							y--;
				}
			}
		}
	}
}