/// @description Return to the map if no music is playing

if (audio_is_playing(snd_bellsong))
    alarm[1] = 1;
else
    end_level();