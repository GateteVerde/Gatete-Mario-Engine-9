/// @description Collect the heart

//If not collected yet
if (ready == 0) {

	//Play 'Cherry' sound
	audio_play_sound(snd_cherry, 0, false);

	//Grant an extra hit
	if (global.safeguard < global.safeguard_max) {
	
		global.safeguard++;
	}
	
	//Collect it
	ready = 1;
	
	//Set scale
	scale = 1;

	//Get 500 points
	with (instance_create_depth(x+8, y, -6, obj_score)) value = 100;

	//Create effect
	with (instance_create_depth(x+8, y+8, -6, obj_blend_ring)) {
	
		beam = true;
		image_blend = make_colour_rgb(243, 126, 249);
	}
}