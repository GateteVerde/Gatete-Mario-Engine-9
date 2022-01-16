/// @description Launch Mario

//Play 'Thud' sound
audio_play_sound(snd_thud, 0, false);

//Create effect
repeat (16) {

	with (instance_create_depth(x, y, 150, obj_smoke))
		motion_set(random_range(75, 105), random(6));
}

//Set vertical speed
vspeed = -4;