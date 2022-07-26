/// @description Reznor logic

//Inherit the parent event
event_inherited();

//Manage movement
if (parent != -1) {

	//Move along with the platform
	x = parent.x;
	y = parent.y-16;

	//Knock out if the platform below gets bumped
	if (parent.block_offset < 0) {
		
		//Play 'Kick' sound
		audio_play_sound(snd_kick, 0, false);
	
		//With the enemy
		with (other) {
	
			//Set killer id and kill
			killer_id = other.id;
			event_user(0);
		}

		//Get 2000 points
		with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, other.bbox_top, -4, obj_score)) value = 2000;
	
		//Create spin thump
		with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
			sprite_index = spr_spinthump;
	}
}