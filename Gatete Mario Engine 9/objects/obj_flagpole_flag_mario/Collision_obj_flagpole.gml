/// @description Keep the flag in sight

//Make sure it does not go past the player
if (vspeed < 0)
&& (y < other.y+other.limit) {

    //Stop 'Flagpole' sound
    audio_stop_sound(snd_flagpole);
    
    //Stop moving
    vspeed = 0;

    //Snap to the player initial position
    y = other.y+other.limit;
	
	//If the score object exists
	if (instance_exists(obj_score_goal)) {
	
		//If the score has the gold flag active
		if (obj_score_goal.gold == true) {
		
			//Play 'Transform' sound
			audio_play_sound(snd_transform, 0, false);
			
			//Change the flag sprite
			image_index = 1 + (2 * global.player);
			
			//Create a smoke effect
			with (instance_create_depth(x+13, y+2, -6, obj_smoke)) sprite_index = spr_pop;
			
			//Leave a trail
			alarm[0] = 1;
		}
	}
}