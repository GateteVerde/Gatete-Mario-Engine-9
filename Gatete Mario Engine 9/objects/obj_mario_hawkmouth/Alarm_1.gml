/// @description Return to the map if no music is playing

if (audio_is_playing(snd_hawksong_clear))
    alarm[1] = 60;
else
    end_level();