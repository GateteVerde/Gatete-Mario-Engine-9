/// @description Play 'Dead / Time Up' fanfare

var _snd = (timeup == 1) ? snd_timeup : snd_dead;
audio_play_sound(_snd, 0, false);