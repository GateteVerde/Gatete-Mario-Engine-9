/// @description Grant one extra hit

//Play 'Powerup' sound
audio_play_sound(snd_powerup, 0, false);

//Play 'Thank you' sound
audio_play_sound(global.voiceline_thankyou, 0, false);

//Grant an extra hit
if (global.safeguard < global.safeguard_max) {
	
	global.safeguard++;
}

//Get 500 points
with (instance_create_depth(x, y, -6, obj_score)) value = 500;

//Create effect
with (instance_create_depth(x, y+8, -6, obj_blend_ring)) {
	
	beam = true;
	image_blend = make_colour_rgb(243, 126, 249);
}

//Destroy
instance_destroy();