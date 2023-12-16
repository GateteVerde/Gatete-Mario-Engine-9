/// @description Deploy fireworks

//Play 'Firework' sound
audio_play_sound(snd_firework_whistle, 0, false);

//Destroy if this
if (image_index == 2) {

	instance_create_depth(x, y+8, -6, obj_smoke);
	instance_destroy();
}

//Otherwise
else {

	with (instance_create_depth(x, y - 4 + (8 * image_index), -6, obj_smoke))
		sprite_index = spr_smoke_c;
}

//Create a firework
instance_create_depth(x, y - 4 + (8 * image_index), -2, obj_popomb_firework);

//Increment
image_index++;

//Repeat
alarm[0] = 60;