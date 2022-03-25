/// @description Destroy object

//Play 'Bump' sound
audio_play_sound(snd_bump, 0, false);

//Create smoke effect
with (instance_create_depth(x, y+8, depth - 2, obj_smoke)) {

	sprite_index = spr_smoke_b;
	image_xscale = 1.5;
	image_yscale = 1.5;
}

//Destroy
instance_destroy();