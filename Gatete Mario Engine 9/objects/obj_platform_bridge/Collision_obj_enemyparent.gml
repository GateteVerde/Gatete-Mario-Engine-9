/// @description Kill enemy NPCs with a block bump

//If the enemy is vulnerable
if (other.vulnerable < 99) {

	//If the block is animating
	if (image_speed != 0) {

		//If the item can be stunned
		if (other.edible == 1) {
		
			//Play 'Kick' sound
			audio_play_sound(snd_kick, 0, false);
	
			//With the enemy
			with (other) event_user(4);

			//Get 200 points
			with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) value = 200;
	
			//Create spin thump
			with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
				sprite_index = spr_spinthump;
		}

		//Otherwise
		else {

			//Play 'Kick' sound
			audio_play_sound(snd_kick, 0, false);
	
			//With the enemy
			with (other) {
	
				//Set killer id and kill
				killer_id = other.id;
				event_user(0);
			}

			//Get 200 points
			with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) value = 200;
	
			//Create spin thump
			with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
				sprite_index = spr_spinthump;
		}
	}
}

//Otherwise, bounce
else if (other.image_speed != 1) 
&& (bbox_bottom < other.yprevious+5) {

	//Set the vertical speed
	other.yspeed = -4 + (other.swimming * 2);
	other.y--;
}