/// @description Destroy flying object and stop sounds

//Destroy flying object
if (instance_exists(obj_mario_fly)) {

	with (obj_mario_fly) instance_destroy();
}

//Stop 'Spin' sound
audio_stop_sound(snd_spin);

//Stop 'Skid' sound
audio_stop_sound(snd_skid);

//Stop 'Climb' sound
audio_stop_sound(snd_climb);

//Stop 'P-Meter' sound
audio_stop_sound(snd_pmeter);