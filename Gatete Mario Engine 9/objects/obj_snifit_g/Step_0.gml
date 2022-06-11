/// @description Gray snifit logic

//Inherit event
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
    
        //Animate
        image_speed = 1;
        
        //End jump
        jumping = 0;
        
        //Jump again
        alarm[1] = 150;
    }
}

//Set lower gravity if jumping
if (jumping > 0) then yadd = 0.15;

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;
