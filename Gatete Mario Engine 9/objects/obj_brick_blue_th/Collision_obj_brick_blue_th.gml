/// @description Destroy

//If this block is being held
if (held) {

    //Play 'Kick' sound
    audio_play_sound(snd_kick, 0, false);

    //Get 1000 points
    with (instance_create_depth(x-8, y, -6, obj_score)) value = 1000;
    
    //Create spin thump
    with (instance_create_depth(round(bbox_left+bbox_right) / 2, round(bbox_top+bbox_bottom) / 2, -6, obj_smoke)) sprite_index = spr_spinthump;
    
    //Destroy brick
    event_user(0);
	if (sprite_index == spr_brick_green_th) {
		
		instance_create_layer(x, y, "Main", obj_explosion_lite);
	}
	
    //Destroy the other block
    with (other) {
			
		event_user(0);
		if (sprite_index == spr_brick_green_th)
			instance_create_layer(x, y, "Main", obj_explosion_lite);
	}
}

//Otherwise, just shatter the other one
else {

    if (ready) {
		
		#region COMBO
	
			//200
			if (hitcombo == 0) {
		
				audio_play_sound(snd_kick_2, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 200;
			}
		
			//400
			else if (hitcombo == 1) {
		
				audio_play_sound(snd_kick_3, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 400;
			}
		
			//800
			else if (hitcombo == 2) {
		
				audio_play_sound(snd_kick_4, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 800;
			}
		
			//1000
			else if (hitcombo == 3) {
		
				audio_play_sound(snd_kick_5, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 1000;
			}
		
			//2000
			else if (hitcombo == 4) {
		
				audio_play_sound(snd_kick_6, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 2000;
			}
		
			//4000
			else if (hitcombo == 5) {
		
				audio_play_sound(snd_kick_7, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 4000;
			}
		
			//8000
			else if (hitcombo == 6) {
		
				audio_play_sound(snd_kick_8, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = 8000;
			}
		
			//1-UP
			else if (hitcombo > 6) {
		
				audio_play_sound(snd_kick, 0, false);
				with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) 
					value = -1;
			}
			hitcombo++;
		
		#endregion
		
		//Shatter other block
        with (other) {
			
			event_user(0);
			if (sprite_index == spr_brick_green_th)
				instance_create_layer(x, y, "Main", obj_explosion_lite);
		}
	}
}