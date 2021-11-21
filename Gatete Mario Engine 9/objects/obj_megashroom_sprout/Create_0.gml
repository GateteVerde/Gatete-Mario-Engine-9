/// @description A mega mushroom coming out from a block

//Play 'Sprout' sound
audio_play_sound(snd_sprout, 0, false);

//Shake the screen
shake_camera(6, ceil(audio_sound_length(snd_sprout) * room_speed), true);

//Scale
scale = 0.1;

//Set the vertical speed
vspeed = -0.25;