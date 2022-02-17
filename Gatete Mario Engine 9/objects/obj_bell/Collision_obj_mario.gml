/// @description Clear the level

//Play 'Bell' sound
audio_play_sound(snd_bell, 0, false);

//Create 'Bell' Mario
instance_create_depth(other.x, other.y, -5, obj_mario_bell);

//Stop music
with (obj_levelcontrol) {

	event_user(0);
	alarm[2] = -1;
}

//Animate
image_speed = 1;

//Destroy Mario
with (obj_mario) instance_destroy();