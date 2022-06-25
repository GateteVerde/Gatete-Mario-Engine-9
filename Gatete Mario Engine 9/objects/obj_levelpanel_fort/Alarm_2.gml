/// @description Animate and set beat animation

//If the level has not been beaten before
if (beaten == 0) {

	//Play 'Destroy' sound
	audio_play_sound(snd_destroy, 0, false);

	//Set frame
	image_index = 1;

	//Create a smoke effect
	with (instance_create_depth(x + 8, y + 8, -4, obj_smoke)) {

		image_xscale = 1.5;
		image_yscale = 1.5;
	}
	
	//Mark as beaten
	beaten = 1;
}