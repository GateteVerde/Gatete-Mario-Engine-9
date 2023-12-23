/// @description Play 'Phanto BG' sound

//Ignore if the key is not held
if (!instance_exists(obj_pullkey_up)) {

	alarm[3] = 1;
	exit;
}

//Play 'Phanto BG' sound
audio_play_sound(snd_phanto_bg, 0, false);

//Repeat
alarm[3] = 120;