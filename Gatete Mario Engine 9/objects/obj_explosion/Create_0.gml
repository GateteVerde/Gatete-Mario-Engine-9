/// @description Explosion

//Play 'Lightning' sound
audio_play_sound(snd_lightning, 0, false);

//Shake the screen
shake_camera(6, ceil(audio_sound_length(snd_thud) * room_speed), true);

//Depth
depth = 450;

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

//Blink view
blink = 0;
blink_on = 1;
alarm[10] = 1;
alarm[11] = 24;
