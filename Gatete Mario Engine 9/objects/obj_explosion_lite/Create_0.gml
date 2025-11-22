/// @description Small Explosion

//Play 'Thud' sound
audio_play_sound(snd_lightning, 0, false);

//Shake the screen
shake_camera(6, ceil(audio_sound_length(snd_thud) * GAME_SPEED), true);

//Depth
depth = -2;

//Combo
hitcombo = 0;

//Hurt Player?
//0: No
//1: Yes
hurtplayer = 1;

//Destroy
alarm[0] = 48;

//Disallow player hurt
alarm[1] = 4;
