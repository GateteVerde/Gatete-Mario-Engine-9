/// @description Destroy

//Play 'Bump' sound
audio_play_sound(snd_bump, 0, false);

//Generate sparks
repeat (8) {

	with (instance_create_depth(x, y, -4, obj_sparkle)) {
	
		motion_set(random(360), random(1));
		shrink_rate = 0.05;
		sprite_index = spr_sparkle_b;
	}
}

//Turn into a puff of smoke
instance_create_depth(x, y, -4, obj_smoke);
instance_destroy();