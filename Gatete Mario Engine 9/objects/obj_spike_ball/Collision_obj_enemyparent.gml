/// @description

//Play 'Kick' sound
audio_play_sound(snd_kick, 0, false);

//With the enemy
with (other) {
	
	killer_id = other.id;
	event_user(0);
}
	
//Create spin thump
with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
	sprite_index = spr_spinthump;