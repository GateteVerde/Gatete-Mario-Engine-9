/// @description Kill with broken pipes	

//Play 'Kick' sound
audio_play_sound(snd_kick, 0, false);
		
//Kill NPC
with (other) {
		
	killer_id = other.id;
	event_user(0);
}
		
//Get 200 points
with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, bbox_top, -4, obj_score)) value = 200;

//Destroy
instance_destroy();
