/// @description Kill with footballs

//Play 'Kick' sound
audio_play_sound(snd_kick, 0, false);

//Get 200 points
with (instance_create_depth(x-8, y, -6, obj_score)) value = 200;
    
//Create spin thump
with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) sprite_index = spr_spinthump;
    
//Destroy both brick and NPC
with (other) {
		
	killer_id = other.id;
	event_user(0);
}
event_user(0);