/// @description Tweeter logic

//Inherit event
event_inherited();

//If there's no gravity
if (yadd == 0) {

    //If the tweeter did less than 3 jumps
    if (jumping < 3) {
    
        //Jump a little
        yspeed = -1.25;
        y--;
        
        //Increment jump
        jumping++;
        
        //Animate
        image_speed = 1;
    }
    
    //Otherwise, if the tweeter jumped 3 times
    else {
    
        //Jump a little
        yspeed = -2.5;
        y--;
        
        //Increment jump
        jumping = 0;
        
        //Animate
        image_speed *= 2;
    }
}

//Face towards direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;
