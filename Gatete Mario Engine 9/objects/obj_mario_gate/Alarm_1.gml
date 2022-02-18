/// @description Start walking again

//If the timer hits zero
if (global.timer == 0) {

    //Play 'Goal End' sound
    audio_play_sound(snd_goalgate_c, 0, false);
    
    //Set states
    ready2 = 0;
    ready3 = 1;
}

//Otherwise
else
    alarm[1] = 60;