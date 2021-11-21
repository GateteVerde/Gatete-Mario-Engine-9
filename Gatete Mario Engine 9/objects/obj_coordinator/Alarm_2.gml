/// @description Give spare lives

if (addlives > 0) {

    //If lives are maxed out, do not give more
    if (lives == 99) {
    
        addlives = 0;
        exit;
    }
    else {
    
        //Play '1up' sound
        audio_play_sound(snd_1up, 0, false);
    
        //Add a life
        lives++;
        
        //Subtract a spare life
        addlives--;
        
        //Continue
        alarm[2] = 30;
    }
}