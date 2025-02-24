/// @description Capture and turn enemies into coins

//Ignore if this is a boss parent
if (object_get_parent(other.object_index) == obj_bossparent)
exit;

//If this bubble has not captured an enemy
if ((capture == 0) && (ready == 1)) {

	//If the enemy is vulnerable
	if (other.vulnerable < 2) {
	
		//Play 'Magic' sound
		audio_play_sound(snd_magic, 0, false);
		
		//Capture
		capture = 1;
		
		//Set the enemy sprite
		enemy_spr = other.sprite_index;
		
		//Create smoke effect on enemy
		instance_create_depth(round(other.bbox_left + other.bbox_right) / 2, round(other.bbox_top + other.bbox_bottom) / 2, -6, obj_smoke);
		
		//Destroy the enemy
		with (other) instance_destroy();
	}

	//If the enemy
	else
		alarm[1] = 1;
}