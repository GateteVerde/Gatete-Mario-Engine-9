/// @description Collision with a Key

if (other.held == true) {

	//If the object is not animating
	if (image_speed == 0) {
	
		//Play 'Door' sound
		audio_play_sound(snd_door, 0, false);
		
		//Animate
		image_speed = 1;
		
		//Remember that this door has been opened
		ds_map_add(global.doors, id, 1);
	}
	
	//Destroy the key
	instance_create_depth(other.x, other.y + 8, -6, obj_smoke);
	with (other) instance_destroy();
	exit;
}