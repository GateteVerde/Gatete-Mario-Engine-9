/// @description Start walking to the goal castle

//Physics state
ready = 2;

//Play 'Flagsong' music
audio_play_sound(snd_flagsong, 0, false);

//Jump off the flagpole
yspeed = -3;
y--;

//Move right 8 pixels
x += 8;

//Face right
image_xscale = 1;