/// @description A coin that came out from a block

//Play 'Coin' sound
audio_play_sound(snd_coin, 0, false);

//Animate
image_speed = 0.5;

//Set motion
vspeed = -3;
gravity = 0.2;

//Increment coins
coins_add();