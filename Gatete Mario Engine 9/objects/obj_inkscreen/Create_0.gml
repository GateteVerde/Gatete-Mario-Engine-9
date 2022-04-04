/// @description Ink Splash

//Play 'Splat' sound
audio_play_sound(snd_splat, 0, false);

//Do not animate
image_speed = 0;
image_index = choose(0, 1, 2, 3);

//Depth
depth = -50;

//Alpha
alpha = 1;

//Fade out
ready = 0;
alarm[0] = 240;
