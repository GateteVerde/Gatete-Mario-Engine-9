/// @description A mega mushroom coming out from a block

//Inherit the parent event
event_inherited();

//Play 'Sprout' sound
audio_play_sound(snd_sprout, 0, false);

//Shake the screen
shake_camera(6, ceil(audio_sound_length(snd_sprout) * GAME_SPEED), true);

//Depth
depth = 50;

//Scale
scale = 0.1;

//Set the vertical speed
yspeed = -0.25;