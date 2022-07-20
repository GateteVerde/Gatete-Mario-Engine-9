/// @description Coin Snake

//Inherit event from parent
event_inherited();

//Play 'Sprout' sound
audio_play_sound(snd_sprout, 0, false);

//Go up
yspeed = -1;

//Next dir
nextdir = 90;

//Start creating coins / bricks every 16 pixels
alarm[0] = 16;

//Change depth
alarm[1] = 16;

//Stop the coin chain if it goes on for too long
alarm[2] = 1024;
