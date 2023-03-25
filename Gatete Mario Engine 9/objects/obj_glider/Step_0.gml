/// @description Glider logic

//Handle psuedo movement
if (freeze == false) {

	y += yspeed;
	yspeed += yadd;
}

#region LOGIC

	//If the balloon has not been grabbed yet
	if (ready == 0)
	&& (freeze == false)
		yspeed += (y > ystart) ? -0.05 : 0.05;

	//Otherwise, if the balloon has been grabbed
	else if (ready == 1) {
		
		//If Mario exists
		if (instance_exists(obj_mario)) {
			
			#region BLAST
			
				//Blast balloon in contact with spikes
				if (collision_rectangle(bbox_left-8, bbox_top-32, bbox_right+7, bbox_top-32, obj_hurtblock, 0, 0)) {
				
					//Play 'Pop' sound
					audio_play_sound(snd_pop, 0, false);
				
					//Release
					ready = 2;
					
					#region
					
						//Create effect
						with (instance_create_depth(x, y-32, -6, obj_spinsmoke)) silent = true;

						//Create extra effects if this balloon glides up
						if (glide_up == true) {
							
							with (instance_create_depth(x-8, y-24, -6, obj_spinsmoke)) silent = true;
							with (instance_create_depth(x+8, y-24, -6, obj_spinsmoke)) silent = true;
						}
					#endregion
				}
			
				//Release balloon if any of these conditions met
				if (obj_mario.yspeed == 0)
				|| (input_check_pressed(input.action_0)) {
					
					//Play 'Jump' sound
					audio_play_sound(snd_jump, 0, false)
					
					//Create balloons
					with (instance_create_depth(x, y, -2, obj_glider_balloons)) image_index = 1 + other.glide_up;
					
					//Release balloon
					ready = 2;
					
					//Make Mario jump
					obj_mario.yspeed = -3.7675;
					obj_mario.y--;
					
					//Make Mario vary their jump
					obj_mario.jumping = 1;
				}

			#endregion
			
			#region PLAYER SNAP
				
				//Stay on Mario's X position
				x = obj_mario.x;
			
				//If this balloon does not glide up
				if (glide_up == false)
					y = ceil(obj_mario.y);
				else
					obj_mario.y = ceil(y);
			#endregion
	
			//If the gliding up flag is active
			if (glide_up == true) {
		
				//Set the vertical speed
				yspeed -= 0.1;
				if (yspeed < -1)
					yspeed = -1;
			}
		
			//Otherwise
			else if (glide_up == false) {
				
				//Set Mario's vertical speed
				obj_mario.yspeed -= obj_mario.yadd / 1.75;
			
				//Prevent Mario from falling down too fast
				if (obj_mario.yspeed > 0.5)
					obj_mario.yspeed = 0.5;
			}
		}
	}
	
	//Otherwise, if the balloon has been released
	else if (ready == 2) {
		
		//Set gravity
		yadd = 0.2;
		if (yspeed > 4) {
		
			yspeed = 4;
			yadd = 0;
		}
	}
#endregion