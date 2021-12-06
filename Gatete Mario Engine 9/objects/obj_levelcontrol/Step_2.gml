/// @description Deals with various game logic stuff

//Warns the player that the P-Switch or S-Switch event is about to end
#region P/S-SWITCH WARNING

	//Play a warning sound when the P-Switch effect is running out
	if (pswitch_warn == 0) {

	    //Check ticks
	    if ((alarm[5] > 0) && (alarm[5] < 120)) {
    
	        audio_play_sound(snd_switch_timer, 0, false);
	        pswitch_warn = 1;
	    }
	}

	//Play a warning sound when the G-Switch effect is running out
	if (sswitch_warn == 0) {

	    //Check ticks
	    if ((alarm[6] > 0) && (alarm[6] < 120)) {
    
	        audio_play_sound(snd_switch_timer, 0, false);
	        sswitch_warn = 1;
	    }
	}
#endregion

//Set up object to follow
event_user(15);

//If the autoscroll object does exist
if (instance_exists(obj_autoscroll)) {
    
    //Snap into position
    x = obj_autoscroll.x;
    y = obj_autoscroll.y;
}

//Otherwise
else {
	
	//If the camera is not following an object
	if (follow != noone) {
        
		//Pan instantly if the barrier is deactivated
		if (barrier == false) {
		
			x = follow.x;
		    y = follow.y;
		}
        
		//Otherwise, perform movement depending of the given conditions
		else {
        
		    //Stay relative to Mario's y position
		    if (instance_exists(obj_mario)) {
				
				#region HORIZONTAL BARRIER
				
					//If the barrier is enabled
					if (barrier == true) {
	
						//If Mario is at the left boundary
						if (obj_mario.x < camera_get_view_x(view_camera[0]) + sprite_get_xoffset(obj_mario.mask_index)) {
			
							//If Mario is flying with the cape
							if (instance_exists(obj_fly)) {
			
								obj_fly.x = camera_get_view_x(view_camera[0]) + 5;
								if (obj_fly.xspeed < 0)
									obj_fly.xspeed = 0;
							}
		
							obj_mario.x = camera_get_view_x(view_camera[0]) + sprite_get_xoffset(obj_mario.mask_index);
							if (obj_mario.xspeed < 0)
								obj_mario.xspeed = 0;
						}
						else if (obj_mario.x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - sprite_get_xoffset(obj_mario.mask_index)) {
			
							//If Mario is flying with the cape
							if (instance_exists(obj_fly)) {
			
								obj_fly.x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 5;
								if (obj_fly.xspeed > 0)
									obj_fly.xspeed = 0;
							}
			
							obj_mario.x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - sprite_get_xoffset(obj_mario.mask_index);
							if (obj_mario.xspeed > 0)
								obj_mario.xspeed = 0;			
						}
					}				
				#endregion
				
				//If the camera is not locked
				if (camlock == false)					
					y = obj_mario.y;
					
				//Otherwise, if the camera is locked
				else {
            
			        //If the player is running, swimming, climbing or wall running
			        if (obj_mario.run == true)
					|| (obj_mario.swimming == 1)
					|| (obj_mario.wallkick == 1)
					|| (obj_mario.squirrelpropel == 1)
					|| ((obj_mario.jumpstyle > 0) && (global.powerup == cs_propeller))
					|| ((obj_mario.state == playerstate.climb) || (instance_exists(obj_wallrunner))) {
						
						//If the camera is 6 pixels below Mario's y position, move 6 pixels upwards until the camera catches the player.
			            if (y > obj_mario.y+6)
			                y -= 6;

			            //Otherwise
			            else
			                y = obj_mario.y;
					}

			        //Otherwise
			        else {

			            //If Mario's is idle or walking
			            if (obj_mario.state == playerstate.idle) 
			            || (obj_mario.state == playerstate.walk) {

			                //Position Mario just reached
							floorY = obj_mario.y;

			                //If Mario is above the camera
			                if (obj_mario.y < y) {

			                    //If the camera is 6 pixels below Mario's y position, move 6 pixels upwards until the camera catches the player.
			                    if (y > obj_mario.y+6)
			                        y -= 6;

			                    //Otherwise
			                    else
			                        y = obj_mario.y;
			                }
			            } 
			            else {

			                //If Mario didn't reach Y position on the ground, catch Mario (only applies going up)
			                if (round(y) < floorY)
			                    y -= 6;
			            }

			            //If Mario is below the camera, catch him instantly
			            if (obj_mario.y > y)
			                y = obj_mario.y;
			        }
				}
				
				//Horizontal speed
				#region CAMERA HOR. SPEED
				
					var check_xspd = obj_mario.xspeed;
					if (instance_exists(obj_fly))
						check_xspd = obj_fly.xspeed;
					else if (instance_exists(obj_dropdown))
						check_xspd = obj_dropdown.xspeed;
				#endregion
				
	            //If the camera is to the right and the player is from a certain distance from the camera
	            if ((orientation == 1) && (obj_mario.x > x-16)) {
                        
	                //Scroll the camera at a certain speed until the camera catches up.
	                if (obj_mario.x > x-12)
	                    x += 2+check_xspd;
	                else
	                    x = obj_mario.x+16;
	            }
            
	            //Otherwise, if the camera is to the left and the player is from a certain distance from the camera
	            else if ((orientation == -1) && (obj_mario.x < x+16) && (classicscroll == 0)) {
            
	                //Scroll the camera at a certain speed until the camera catches up.
	                if (obj_mario.x < x+12)
	                    x -= 2-check_xspd;
	                else
	                    x = obj_mario.x-16;    
	            }
            
	            //If the player is moving to the left and the camera is panning to the right, make the camera pan to the left
	            if ((obj_mario.x-xprevious < 0) && (obj_mario.x < x-40) && (classicscroll == 0))
	                orientation = -1;
            
	            //Otherwise, if the player is moving to the right and the camera is panning to the left, make the camera pan to the right.
	            else if ((obj_mario.x-xprevious > 0) && (obj_mario.x > x+40))
	                orientation = 1;
		    }
		    else {
				
				//Handle camera position when Mario is not the main focus
				#region CAMERA Y POSITION
				
					//If the camera is 6 pixels below Mario's y position, move 6 pixels upwards until the camera catches the player.
				    if (y > follow.y+6)
				        y -= 6;

				    //Otherwise
				    else
				        y = follow.y;
				#endregion
				
				//Horizontal speed
				var check_xspd = follow.xspeed;
				
	            //If the camera is to the right and the player is from a certain distance from the camera
	            if ((orientation == 1) && (follow.x > x-16)) {
                        
	                //Scroll the camera at a certain speed until the camera catches up.
	                if (follow.x > x-12)
	                    x += 2+check_xspd;
	                else
	                    x = follow.x+16;
	            }
            
	            //Otherwise, if the camera is to the left and the player is from a certain distance from the camera
	            else if ((orientation == -1) && (follow.x < x+16) && (classicscroll == 0)) {
            
	                //Scroll the camera at a certain speed until the camera catches up.
	                if (follow.x < x+12)
	                    x -= 2-check_xspd;
	                else
	                    x = follow.x-16;    
	            }
            
	            //If the player is moving to the left and the camera is panning to the right, make the camera pan to the left
	            if ((follow.x-xprevious < 0) && (follow.x < x-40) && (classicscroll == 0))
	                orientation = -1;
            
	            //Otherwise, if the player is moving to the right and the camera is panning to the left, make the camera pan to the right.
	            else if ((follow.x-xprevious > 0) && (follow.x > x+40))
	                orientation = 1;
			}
		}
	}
}

//Clamp Y
var shake_val = 0;

//If there is a camera shake to occur
if (shake_time > 0) {
	
	//If the shake falls off from it's original value, calculate the shake value relative to the time left in the timer
	if (shake_falloff)
		shake_val = shake_intensity * (shake_time / shake_starttime);		
	
	//Otherwise
	else {
	
		//Match shake value to shake intensity
		shake_val = shake_intensity;
	}
	
	//Choose randomly between up and down shake
	shake_val = choose(-shake_val, shake_val);
	
	//Subtract shake time
	shake_time--;	
} 
else {

	// Make sure the shake time & start time bottom out to 0
	shake_time = 0;
	shake_starttime = 0;	
}

//Clamp the X/Y position to the room so that shakes on the bottom of the screen still occur fine
var camera_x = screen_round(clamp(x, camera_get_view_width(view_camera[0])/2, room_width - camera_get_view_width(view_camera[0])/2) - (camera_get_view_width(view_camera[0])/2));

//Initial clamp in view
var camera_y = screen_round(clamp(y, camera_get_view_height(view_camera[0])/2, room_height - camera_get_view_height(view_camera[0])/2) - (camera_get_view_height(view_camera[0])/2));

//Clamp the screen shake
if (shake_val != 0) {
	
	camera_y = screen_round(clamp(camera_y+shake_val, 0, room_height-camera_get_view_height(view_camera[0])));
}

//Ensure there is no view target so that the camera can be manually moved
camera_set_view_target(view_camera[0], noone);

//Set the camera position
camera_set_view_pos(view_camera[0], camera_x, camera_y);

//Manage background position
#region PARALLAX BACKGROUNDS
		
	#region BACKGROUND 0
		
		#region POSITION SETUP
		
			//Get ID from "Background 0"
			var lay_id = layer_get_id("Background_0");
			
			//Get data from said layer
			var back_id = layer_background_get_id(lay_id);
			var back_spr = layer_background_get_sprite(back_id);

			//Horizontal parallax
			layer_x("Background_0", camera_x / 2);
			
			//Vertical parallax
			if (sprite_get_height(back_spr) < room_height)
			&& (sprite_get_height(back_spr) > camera_get_view_height(view_camera[0]))
				layer_y("Background_0", camera_y * (room_height - sprite_get_height(back_spr)) / (room_height -  camera_get_view_height(view_camera[0])));		
		
		#endregion
	
	#endregion
	
	//Background 1
	layer_x("Background_1", camera_x / 4);
	
	//Background 2
	layer_x("Background_2", camera_x / 6);
	
#endregion

#region RESERVE ITEM

	//If the reserve item system is activated
	if (global.reserve_activated == true) {
		
		//If the barrier is enabled and Mario exists
		if (barrier == true)
		&& (instance_exists(obj_mario)) 
		&& (obj_mario.enable_control == true) {
	
			//If there's a reserve item in reserve and the space key is pressed
			if (global.reserve != cs_small)
			&& (input_check_pressed(input.action_2))
				event_user(2);
		}
	}
#endregion