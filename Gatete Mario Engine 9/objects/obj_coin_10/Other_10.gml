/// @description Coin collect animation

//Play 'Big Coin' sound
audio_play_sound(snd_coin_big, 0, false);

//Animate faster
image_speed *= 4;
ready = 2;

//Set depth
depth = -2;

//Set motion
vspeed = -3;
gravity = 0.2;