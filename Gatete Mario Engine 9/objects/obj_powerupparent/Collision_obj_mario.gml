/// @description Get a powerup

//Get 1000 points
if (noscore == false) {
			
	with (instance_create_depth(x, y, -6, obj_score)) 
		value = 1000;
}

//Create effect
with (instance_create_depth(x, y+8, -6, obj_blend_ring)) beam = true;

//If Mario does not have the gold or mega powerup
if (global.powerup != cs_gold)
&& (global.powerup != cs_mega) {

	//If the player does have a powerup.
	if (global.powerup > cs_big)
	    global.reserve = global.powerup;

	//If the player does not have the correct powerup.
	if (global.powerup != sprite_get_macro(sprite_index)) {

	    //Give out the correct powerup
	    global.powerup = sprite_get_macro(sprite_index);
    
	    //Perform animation sequence and play sound
	    with (instance_create_depth(0, 0, -5, obj_mario_transform)) {
    
	        sequence = other.sequence;
	        if (other.sequence != 4)
	            audio_play_sound(snd_powerup, 0, false);
	        else {
			
				if (other.sprite_index == spr_feather)
					audio_play_sound(snd_feather, 0, false);
				else
					audio_play_sound(snd_transform, 0, false);
			}
	    }
	}
	else {

	    //Play 'Powerup' sound
	    audio_play_sound(snd_powerup, 0, false);
	}
}
else {
	
	//Play 'Reserve' sound
	audio_play_sound(snd_reserve, 0, false);
	
	//Set it on the reserve box if the held item is not a golden flower
	if (global.reserve != cs_gold)
		global.reserve = sprite_get_macro(sprite_index);
}

//Destroy
instance_destroy();