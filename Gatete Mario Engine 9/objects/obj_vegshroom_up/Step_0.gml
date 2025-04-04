/// @description When mushroom falls down, destroy

if ((vspeed > 0) && (y > ystart - 16)) {
	
	//Mushroom
	if (sprite_index == spr_vegshroom) {
		
		//Play 'Mushroom' fanfare
		audio_play_sound(snd_mushroom, 0, false);
		
		//If health mode is active, restore all health
		if (global.hp_mode == true)
			global.hp = global.hp_max;
		
		//Otherwise, enable safeguard mode
		else {
		
			//If Mario is tiny or small
			if (global.powerup == cs_tiny)
			|| (global.powerup == cs_small) {
	
				//Play 'Powerup' sound.
				audio_play_sound(snd_powerup, 0, false);
				
				//Play 'Jwin' sound
				play_voiceline(global.voiceline_jwin, 0, false);
        
			    //Perform animation sequence
			    with (instance_create_depth(0, 0, -5, obj_mario_transform)) {
		
					if (global.powerup == cs_tiny)
						sequence = -1;
					else
						sequence = 0;
				}
	
			    //Turn Mario into 'Super' Mario.
			    global.powerup = cs_big;
			}
		
			//Grant max safeguards
			global.safeguard = global.safeguard_max;
		}

		//Get 1000 points
		with (instance_create_depth(x+8, y, -6, obj_score)) value = 1000;

		//Create effect
		with (instance_create_depth(x+8, y+8, -6, obj_blend_ring)) {
	
			beam = true;
			image_blend = make_colour_rgb(243, 126, 249);
		}		
	}
	
	//Otherwise
	else if (sprite_index == spr_vegshroom_1up) {
		
		#region EFFECT

			//Repeat 16 times
			repeat (16) {
	
				with (instance_create_depth(x+8, y+8, -2, obj_sparkle)) {
	
					sprite_index = spr_sparkle_e;
					motion_set(random(360), random(1.5));
				}
			}

			//Create effect
			with (instance_create_depth(x+8, y+8, -6, obj_blend_ring)) {
	
				beam = true;
				image_blend = make_colour_rgb(160, 232, 32);
			}
		#endregion
		

		//Get 1 extra life
		with (instance_create_depth(x+8, y, -6, obj_score)) 
			value = -1;
	}
	
	//Create smoke
	instance_create_depth(x+8, y+8, -4, obj_smoke);
	
	//Destroy
	instance_destroy();	
}