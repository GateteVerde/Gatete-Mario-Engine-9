/// @description Finish block bump

//Play 'Switch' sound
audio_play_sound(snd_switch, 0, false);

//Change block state
global.on_off_block = !global.on_off_block;

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Allow block to be bumped again
ready = 0;