/// @description Kill NPC with lightning bolts

//If the enemy is vulnerable
if (other.vulnerable < 99) {
	
	//Play 'Kick' sound
	audio_play_sound(snd_kick, 0, false);
		
	//Kill NPC
	with (other) {
		
		killer_id = other.id;
		event_user(0);
	}
		
	//Get 200 points
	with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, bbox_top, -4, obj_score)) 
		value = 200;
}