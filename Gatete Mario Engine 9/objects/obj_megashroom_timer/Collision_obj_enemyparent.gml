/// @description Kill with the power of invincibility

//If the enemy is vulnerable
if (other.vulnerable < 99) {

	//Play 'Kick' sound
	audio_play_sound(snd_kick, 0, false);
	
	//With the enemy
	with (other) {
	
		killer_id = other.id;
		event_user(0);
	}

	//Get 200 points
	with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) value = 200;
	
	//Create spin thump
	with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
		sprite_index = spr_spinthump;
}
