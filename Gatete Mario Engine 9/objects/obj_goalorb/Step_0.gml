/// @description Collision with Mario

//Inherit the parent event
event_inherited();

//If this ball is still visible
if (image_alpha == 1) {
	
	//If Mario collides with this object
	if (place_meeting(x, y, obj_mario)) {
	
		//Play 'Cards - Match' fanfare
		audio_play_sound(snd_cardsong_match, 0, false);
		
		//Destroy every NPC in position
		ai_npc_destroy();

		//Disable Mario's controls
		with (obj_mario) enable_control = false;

		//Stop both music and timer
		with (obj_levelcontrol) {

			event_user(0);
			alarm[2] = 0;
		}

		//Clear the level
		global.clear = 1;

		//Forget check points
		global.checkpoint = noone;

		//Do not bring kuribo shoes outside
		if (global.mount == 2) {

			//Play 'Transform' sound
			audio_play_sound(snd_powerlost, 0, false);
    
			//Forget it
			global.mount = 0;
    
			//With the shoe
			with (obj_kuriboshoe) {
    
			    //Create flying shoe
			    with (instance_create_depth(x, y, -6, obj_kuriboshoe_lost)) {
        
			        sprite_index = other.sprite_index;
			        image_xscale = other.xscale;
			        hspeed = -1;
			    }
        
			    //Destroy
			    instance_destroy();
			}
		}

		//Orb collected
		image_alpha = 0;
		instance_create_depth(x, y+8, -6, obj_smoke);
	
		//Begin timer countdown
		alarm[0] = 350;
	}
}

//Otherwise, if the fanfare is not longer playing
else if (image_alpha == 0) {

	//If the fanfare is still playing
	if (audio_is_playing(snd_cardsong_match))
	exit;
	
	//If there's no time to collect
	if (ready == 0)
	&& (global.timer == 0) {
	
		//Prevent this event from looping
		ready = 1;
		
		//Return to map
		alarm[1] = 120;
	}
}