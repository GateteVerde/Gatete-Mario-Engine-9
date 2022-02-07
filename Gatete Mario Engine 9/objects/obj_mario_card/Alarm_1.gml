/// @description Return to the map if no music is playing

if (audio_is_playing(mygoal.stream))
    alarm[1] = 1;
else
    end_level();