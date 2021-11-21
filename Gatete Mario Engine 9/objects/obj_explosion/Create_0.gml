/// @description Explosion

//Play 'Thud' sound
audio_play_sound(snd_thud, 0, false);

//Shake the screen
shake_camera(6, ceil(audio_sound_length(snd_thud) * room_speed), true);

//Combo
hitcombo = 0;

//Hurt Player?
//0: No
//1: Yes
hurtplayer = 1;

//Destroy
alarm[0] = 48;

//Generate star effect
alarm[1] = 1;

//Disallow player hurt
alarm[3] = 4;