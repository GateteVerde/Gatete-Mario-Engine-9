/// @description Remember the star for the next room

//Remember combo
global.hitcombo = hitcombo;

//If the starman is still running.
if (alarm[0] > 5)
    global.starman = alarm[0];
        
//Otherwise
else
    audio_stop_sound(snd_starman); 