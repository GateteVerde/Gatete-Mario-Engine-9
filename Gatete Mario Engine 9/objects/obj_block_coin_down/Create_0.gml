/// @description A coin that came out from a block

//Play 'Coin' sound
audio_play_sound(snd_coin, 0, false);

//Animate faster
image_speed *= 4;

//Set motion
vspeed = 2.5;
friction = 0.1;

//Increment coins
coins_add();