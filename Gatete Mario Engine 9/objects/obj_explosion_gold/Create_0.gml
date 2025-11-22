/// @description Explosion

//Play 'Thud' sound
audio_play_sound(snd_thud, 0, false);

//Shake the screen
shake_camera(6, ceil(audio_sound_length(snd_thud) * GAME_SPEED), true);

//Combo
hitcombo = 0;

//Hurt Player?
//0: No
//1: Yes
hurtplayer = 0;

//Scale
scale = 0;
image_xscale = 0;
image_yscale = 0;