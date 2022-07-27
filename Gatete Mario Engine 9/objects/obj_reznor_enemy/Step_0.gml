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
	
		//Create spin thump
		with (instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke)) 
			sprite_index = spr_spinthump;
	}
}

//If Reznor is not breaking the fourth wall
if (image_index != 0) {
	
	//If Mario does not exist or it's at the left
	if (!instance_exists(obj_mario))
	|| (obj_mario.x < x)
		xscale = -1;
	else
		xscale = 1;
}