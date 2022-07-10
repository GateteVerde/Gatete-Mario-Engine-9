/// @description Destroy the solid blocking the way to the real door

//Play 'Thud' sound
audio_play_sound(snd_lightning, 0, false);

//Shake the screen
shake_camera(6, ceil(audio_sound_length(snd_thud) * room_speed), true);

//Destroy the solid blocking the way
instance_destroy(inst_3F56FA3E);