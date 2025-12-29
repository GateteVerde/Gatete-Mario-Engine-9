/// @description Kill enemy NPCs with a tail spin

//Exit if any of the following conditions is met
if ((other.object_index == obj_dinorhino) && (global.powerup != cs_ranger))
exit;

//If the item can be stunned
if (other.edible == 1) 
|| (other.object_index == obj_koopatrol) 
|| (other.sprite_index == spr_shell_koopatrol) {
	
	//Play 'Kick' sound
	audio_play_sound(snd_kick, 0, false);
	
	//If Mario does not have the whip
	if (global.powerup != cs_ranger) {
		
		//With the enemy
		with (other) event_user(4);
	}
	
	//Otherwise
	else if (other.vulnerable < 2) {
	
		//With the enemy
		with (other) {
		
			//Set killed ID
			killer_id = other.id;
	
			//Kill
			event_user(0);
		}
	}
	
	//Get 200 points
	with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) value = 200;
	
	//Create spin thump
	with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
		sprite_index = spr_spinthump;
}

//Otherwise
else if (other.vulnerable < 2) {

	//Play 'Kick' sound
	audio_play_sound(snd_kick, 0, false);
	
	//With the enemy
	with (other) {
		
		//Set killed ID
		killer_id = other.id;
	
		//Kill
		event_user(0);
	}

	//Get 200 points
	with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) value = 200;
	
	//Create spin thump
	with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
		sprite_index = spr_spinthump;
}