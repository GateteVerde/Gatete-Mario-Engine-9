/// @description Lifted Large Red Pow Block logic

//If the object is being held.
if (held) {

    //If the control key is being pressed and the vegetable can be thrown.
    if (input_check_pressed(input.action_1)) {
    
        //If the player does exist.
        if (instance_exists(obj_mario)) {
        
            //Play 'Throw' sound
            audio_play_sound(snd_throw, 0, false);
			
			//Play 'Player Throw' sound
			play_voiceline(global.voiceline_throw, 0, false);
            
			//With Mario
            with (obj_mario) {
				
				holding = 0;
				kicking = 1;
				alarm[5] = 10;
			}
            
            //Check if 'Up' is pressed and throw the object upwards if so.
            if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {

                //Set the vertical speed
                yspeed = (place_meeting(x, y, obj_swim)) ? -3 : -6;
                yadd = 0.2;
                
                //Set the horizontal speed
                xspeed = obj_mario.xspeed/1.5;
            }
            
            //Otherwise, if it's not.
            else {
            
                //Set the vertical speed
                yspeed = 0.1;
                yadd = 0.2;
						
				//Set the horizontal speed
				if (obj_mario.xscale == 1)
		            xspeed = obj_mario.xspeed+2.5;
		        else
		            xspeed = obj_mario.xspeed-2.5;
            }
            
            //Stop holding.
            held = false;
        }
    }
}
else {
	
	//Handle psuedo movement
	if (freeze == false) {
	
		x += xspeed;
		y += yspeed;
		yspeed += yadd;
	}
	
	//If collisions are allowed
	if (allow_collision == true) {
		
		//NPC Wall & Ceiling
		ai_npc_wall(1);
		ai_npc_ceiling(1);

		//Handle position when in-ground
		if (yspeed >= 0) {

			//Check for a conveyor
			var conveyor = collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+2, obj_conveyorparent, 0, 0);
		
			//If there's a conveyor
			if (conveyor)
			&& (conveyor.image_speed != 0) {
		
				//If the conveyor is moving and there's not solid on the way
				if ((conveyor.image_speed < 0) && (!collision_rectangle(bbox_left, bbox_top+4, bbox_left, bbox_bottom-1, obj_solid, 0, 0)))
				|| ((conveyor.image_speed > 0) && (!collision_rectangle(bbox_right, bbox_top+4, bbox_right, bbox_bottom-1, obj_solid, 0, 0)))
					x += conveyor.image_speed;
			}
	
			//Vspeed capacity
			yspeed = min(4 - (swimming * 2), yspeed);
	
			//Check for any nearby ground collision
			var semisolid = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_semisolid, 0, 0);
	
			//If there's ground below and Mario is not moving upwards
			if (semisolid)
			&& (bbox_bottom < semisolid.yprevious + 5)
				y = semisolid.bbox_top - floor(sprite_height-(sprite_get_yoffset(sprite_index)));
		}

		//Slope Collision
		slope_collision();

		//Check if there's a semisolid
		if ((collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0)) 
		&& (!collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom-4, obj_semisolid, 0, 0))) 
		|| (collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_slopeparent, 1, 0)) {
	
			//If moving down
			if (yspeed > 0) {
	
				//Play 'Thud' sound
				audio_play_sound(snd_thud, 0, false);

				//Shake the screen
				shake_camera(6, ceil(audio_sound_length(snd_thud) * room_speed), true);

				//Create POW instance
				instance_create_layer(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2, "Main", obj_powblock_killer);
				
				//Create smoke effect
				with (instance_create_depth(x + 8, y, -6, obj_smoke)) sprite_index = spr_supersmash;
				with (instance_create_depth(x - 8, y, -6, obj_smoke)) {
	
					sprite_index = spr_supersmash;
					image_xscale = -1;
				}
				
				//If the pow can still bounce
				if (bounces > 0) {
					
					//Set vertical speed
					yspeed = -4;
					y--;
					
					//Decrement bounces
					bounces--;
					
					//Set flattened sprite
					sprite_index = spr_powblock_red_large_up_b;
					alarm[0] = 8;
				}
				
				//Otherwise,
				else {
					
					//Create smoke effect
					with (instance_create_depth(x + 8, y, -4, obj_smoke)) {
					
						image_xscale = 2;
						image_yscale = 2;
					}

					//Destroy
					instance_destroy();
				}
			}
		}
	}
	
	//Gravity
	yadd = (swimming) ? 0.03125 : 0.25;
	
	//Vertical speed capacity
	yspeed = min(4 - (swimming * 2), yspeed);
	
	//Check for a water object
    var water = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0);
    
    //If the object is not underwater and makes contact with water
    if ((water) && (!swimming)) {
    
        //Make the object go underwater
        swimming = true;
        
        //Slowdown
        xspeed = xspeed/2;
        
        //Stop vertical movement
        yadd = 0;
        if (yspeed > 0)
            yspeed = 0;
    }
    
    //Otherwise, if the object is underwater and it's not underwater, end swimming.
    else if ((!water) && (swimming)) {
    
        swimming = false;
        xspeed = xspeed*2;
    }
}

