/// @description Jump towards the player

//Play 'Blargg' sound
audio_play_sound(snd_blargg, 0, false);

//Move up
alarm[0] = 180;

//Jump towards the player
instance_create_depth(x, y, 150, obj_blargg_jump);
