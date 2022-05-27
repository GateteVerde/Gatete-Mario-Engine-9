/// @description Thwimp logic

//Inherit the parent event
event_inherited();

//Animate
if (yadd > 0) {

    //If jumping and moving down, wait until floor is reached
    if (yspeed > 0)
    && (jumping == 1)
        jumping = 2;
}
else {

    if (jumping == 2) {
    
        //Play 'Bump' sound
        audio_play_sound(snd_bump, 0, false);
    
        //Stop horizontal speed
        xspeed = 0;
        
        //End jump
        jumping = 0;
        
        //Jump again
        alarm[0] = 100;
    }
}
