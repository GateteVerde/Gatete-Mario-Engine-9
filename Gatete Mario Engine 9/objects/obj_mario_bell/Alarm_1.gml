/// @description Return to the map if no music is playing

if (audio_is_playing(snd_bellsong))
    alarm[1] = 60;
else
    end_level();