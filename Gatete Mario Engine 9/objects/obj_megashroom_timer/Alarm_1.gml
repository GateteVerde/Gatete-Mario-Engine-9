/// @description Play mega shroom music

//End level music and reset global.music
obj_levelcontrol.alarm[1] = 1;

//Play 'Mega Shroom' theme
//if (!audio_is_playing(snd_pswitch))
if (!audio_is_playing(snd_megashroom))
    audio_play_sound(snd_megashroom, 0, true);