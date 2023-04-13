/// @description Icicle logic

//Perform event from parent
event_perform_object(obj_platformparent, ev_step, ev_step_end);

//Check for Mario
var mario = collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0);

//If not moving vertically
if (vspeed == 0) {
	
	//If Mario is on this icicle
	if (mario) 
	&& (mario.state < playerstate.jump) 
	&& (mario.bbox_bottom < yprevious+5)
		ready = 1;
		
	//Otherwise
	else {
		
		//If Mario does exist
		if (instance_exists(obj_mario)) {
		
			//If Mario is below this icicle
			if (obj_mario.y > bbox_top) {
			
				//If Mario is nearby this icicle
				if (obj_mario.x > bbox_left-32) 
				&& (obj_mario.x < bbox_right+32)
					ready = 1;
					
				//Otherwise
				else {
				
					ready = 0;
					alarm[0] = 28;
					alarm[1] = 1;
				}
			}
			
			//Otherwise
			else {
				
				ready = 0;
				alarm[0] = 28;
				alarm[1] = 1;	
			}
		}
		
		//Otherwise
		else {
		
			ready = 0;
			alarm[0] = 28;
			alarm[1] = 1;			
		}
	}
}

//Otherwise, if falling down
else if (vspeed > 0) {

	//Set falling state
	ready = 2;
	
	//If Mario does exist
	if (mario)
	&& (mario.state < playerstate.jump)
	&& (mario.bbox_bottom < yprevious+5) {
	
		//Check for a donut
		var check = collision_rectangle(mario.bbox_left, bbox_top-5, mario.bbox_right, bbox_top+1, obj_semisolid, 0, 1);
		var check2 = collision_rectangle(mario.bbox_left, bbox_top-5, mario.bbox_right, bbox_top+1, obj_semisolid, 0, 1);
	
		//If there's a donut in position
		if (check)
		&& ((!check2)
		|| (((check2.object_index = obj_donut) || (check2.object_index == obj_donut_red) || (check2.object_index == obj_donut_triple) || (check2.object_index == obj_donut_triple_red)) && ((check2.y > y) || ((check2.y = y) && (check2 > id))))) 
			mario.y = ceil(bbox_top-15);
	}
}

//Destroy if below the view or when it makes contact with a solid
if (ready == 2) {
	
	#region FLOOR COLLISION
	
		//If the icicle collides with the floor, move it to the bottom boundary
		if (collision_point(x+8, bbox_bottom, obj_semisolid, 0, 1))
		|| (collision_point(x+8, bbox_bottom, obj_slopeparent, 1, 1)) {
			
			//If this icicle did not reached the ground
			if (ground_check == 0) {
		
				//Play 'Icicle' sound
				audio_play_sound(snd_icicle, 0, false);
				
				//Create sparks
				repeat(32) {

				    with (instance_create_depth(x + 8, y + 16, -4, obj_sparkle)) {
				
				        motion_set(random(360), random(1));
						gravity = 0.1;
					}
				}
				
				//Prevent collision
				ground_check = 1;
		
				//Move to the bottom boundary
				y = room_height;		
			}
		}
	#endregion
	
	//If the icicle collides is below the boundary
	if (bbox_top > (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))) {
		
		//Decrement respawn rate
		respawn--;
		
		//If the respawn rate is lower than 0
		if (respawn < 1) {
		
			//Increment scale
			scale += 0.05;
			if (scale > 1) {
				
				//Restart ground check
				ground_check = 0;
			
				//Restart scale
				scale = 0;
				
				//Restart movement and position
				vspeed = 0;
				y = ystart;
				
				//Restart state
				ready = 0;
				
				//Restart timer
				respawn = 180;
			}
		}
	}
}

//If this donut is slippery
if (ice)
&& (myslip != -1)
	myslip.y = y-16;