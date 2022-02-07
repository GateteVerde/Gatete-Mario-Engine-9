/// @description Take points off the time, and add to the score

//If there is no time left
if (global.timer == 0) 
    alarm[1] = 1;

//Otherwise
else {

    //If the time is greater than 4, decrement 5 seconds from timer
    if (global.timer > 4) {
    
        //Repeat the process
        alarm[0] = 2;
    
        //Get 250 points
        score += 250;
        
        //Decrement 5 seconds
        global.timer -= 5;
    }
    
    //Otherwise, decrement timer by 1 second
    else if ((global.timer < 5) && (global.timer > 0)) {
    
        //Repeat the process
        alarm[0] = 2;
    
        //Get 50 points
        score += 50;
        
        //Decrement 1 second
        global.timer--;
    }

    //Play 'Count' sounds
    if (ready3 == 0) {
    
        //If the timer is greater than 0
        if (global.timer > 0) {
        
            ready3 = 1;
            audio_play_sound(snd_count, 0, false);
            audio_play_sound(snd_count_2, 0, true);
        }
        else {
        
            ready3 = 2;
            audio_play_sound(snd_count_end, 0, false);
        }
    }
    else if ((global.timer < 1) && (ready3 == 1)) {
    
        ready3 = 2;
        audio_stop_sound(snd_count_2);
        audio_play_sound(snd_count_end, 0, false);
    }    
}