/// @description Apply vertical speed

//If this is not falling
if (ready != 2) {

	//Play 'Icicle Fall' sound
	audio_play_sound(snd_icicle_fall, 0, false);

	//Set vertical speed
	vspeed = 2;
}