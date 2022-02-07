/// @description Open hawkmouth's mouth

//Play 'Hawkmouth' sound
audio_play_sound(snd_hawkmouth, 0, false);

//Destroy mytop
with (mytop) instance_destroy();

//Open
ready = 2;