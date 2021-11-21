/// @description Bolt Lift Logic

#region MANAGE STATES

	//If the bolt lift is still on a screw
	if (state == 0) {
		
		//Make it fall if no longer in a screw
		if (!collision_line(bbox_left, y + 8, bbox_right, y + 8, obj_platform_bolt_screw, 0, 0)) {
		
			//Set up falling state
			state = 1;
			
			//Force end alarm 0
			alarm[0] = -1;
			
			//Set up gravity
			gravity = 0.15;
		}
		
		#region WALL FLAGS
		
			//If there's a wall to the right
			if (collision_point(bbox_right + 1, y + 8, obj_solid, 0, 0)) {
				
				//Activate flag
				touchwall_r = true;
				
				//Stop the platform
				if ((state == 0) && (hspeed > 0)) {
					
					//Snap to grid
					move_snap(16, 16);
					
					//Stop animation
					image_speed = 0;
				
					//Stop horizontal speed
					hspeed = 0;
					
					//Stop spinning
					if (isspin)
						isspin = false;
				}
			}
				
			//Otherwise if there's a wall to the left
			else if (collision_point(bbox_left - 1, y + 8, obj_solid, 0, 0)) {
				
				//Activate flag
				touchwall_l = true;
				
				//If moving left
				if ((state == 0) && (hspeed < 0)) {
					
					//Snap to grid
					move_snap(16, 16);
					
					//Stop animation
					image_speed = 0;
				
					//Stop horizontal speed
					hspeed = 0;
				}
			}
				
			//Otherwise if there's no walls at the sides...
			else {
			
				//Deactivate both flags
				touchwall_r = false;
				touchwall_l = false;
			}
		#endregion
	}
	
	//Otherwise, if the bolt lift is falling
	else if (state > 0) {
	
		//If the bolt lift reached the bottom boundary
		if (state == 1)
		&& (bbox_top > (camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))) {
	
			state = 2;
			alarm[1] = 1;
		}
		
		//Reset spin
		isspin = 0;
		
		//Reset offset
		platform_offset = 0;
		
		//Cap vertical speed
		if (vspeed > 3)
			vspeed = 3;
	}

#endregion

//Manage platform offset
if (isspin == 1) {

	platform_offset++;
	if (platform_offset > 16) {
	
		platform_offset = 0;
		isspin = 0;
		alarm[0] = 60;
	}
}
else
	platform_offset = 0;

//Manage platform position
mytop.x = x;
if (state == 0)
	mytop.y = y + platform_offset;
else
	mytop.y = y;