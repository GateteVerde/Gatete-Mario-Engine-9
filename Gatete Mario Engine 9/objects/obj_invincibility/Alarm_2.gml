/// @description Play invincibility music

//End level music and reset global.music
obj_levelcontrol.alarm[1] = 1;

//Play 'Starman' theme
//if (!audio_is_playing(bgm_pswitch))
if (!audio_is_playing(snd_starman))
    audio_play_sound(snd_starman, 0, true);