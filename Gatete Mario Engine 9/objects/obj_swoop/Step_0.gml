/// @description Swoop logic

//If swoop is on the ceiling
if (ready == 0) {

    //If Mario does exists
    if (instance_exists(obj_mario)) {
    
        //If Mario is nearby...
        if ((obj_mario.x > x-32) && (obj_mario.x < x+32))
        
        //...and Mario is below swoop
        && (obj_mario.y > y) {
        
            //Play 'Swoop' sound
            audio_play_sound(snd_swoop, 0, false);
            
            //Set flying sprite
            sprite_index = spr_swoop_fly;
            
            //Set the vertical speed
            vspeed = 1.5;
            
            //Set the horizontal motion
            if (obj_mario.x < x)
                ready = -1;
            else
                ready = 1;
        }
    }
    
    //Set the facing direction
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xscale = -1;
    else
        xscale = 1;
}

//Otherwise, if swoop is flying
else {

    //If swoop is flying to the right
    if (ready == 1) {
    
        if (direction == 0)
            direction = 0;
        else if (direction != 0)
            direction += 0.75;
    }
    
    //Otherwise, if swoop is flying to the left
    else if (ready == -1) {
    
        if (direction == 180)
            direction = 180;
        else if (direction != 180)
            direction -= 0.75;
    }
        
    //Set the facing direction
    if (hspeed > 0)
        xscale = 1;
    else if (hspeed < 0)
        xscale = -1;
}
