/// @description Collision with Mario

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//If this power star is still visible
if (ready2 == 0) {
	
	//If Mario collides with this object
	if (place_meeting(x, y, obj_mario)) {
	
		//Play 'Cards - No Match' fanfare
		audio_play_sound(snd_cardsong_nomatch, 0, false);
		
		//Play 'Big Coin' sound
		audio_play_sound(snd_coin_big, 0, false);
		
		//Destroy every NPC in position
		ai_npc_destroy();

		//Disable Mario's controls
		with (obj_mario) enable_control = false;
		
		//Add to power star map
		ds_map_add(global.powerstars, id, 1);

		//Stop both music and timer
		with (obj_levelcontrol) {

			event_user(0);
			alarm[2] = 0;
		}

		//Clear the level
		global.clear = secret_exit+1;

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
		
		//Begin timer countdown
		alarm[0] = 240;
		
		//Display 'Course' Clear
		alarm[3] = 120;

		//Orb collected
		ready2 = 1;
		
		//Create effect
		with (instance_create_depth(x, y+8, -6, obj_blend_ring)) 
			beam = true;
	}
}

//Otherwise, if the fanfare is not longer playing
else if (ready2 == 1) {
	
	//Set vertical speed
	yspeed -= 0.25;
	if (yspeed < -4)
		yspeed = -4;

	//If the fanfare is still playing
	if (!audio_is_playing(snd_cardsong_nomatch)) {
	
		//If there's no time to collect
		if (ready == 0)
		&& (global.timer == 0) {
	
			//Prevent this event from looping
			ready = 1;
		
			//Return to map
			alarm[1] = 120;
		}
	}
}

//If the star has not been collected, wave up and down.
if (ready2 == 0)
	yspeed += (y > ystart) ? -0.025 : 0.025;