/// @description Kuribo Shoe Goomba logic

//Inherit the parent event
event_inherited();

//Update anim
anim += 0.15;

//Start jumping again
if (yadd == 0) {

    //If the goomba was jumping
    if (jumping == 2) {
    
        //Stop horizontal speed
        xspeed = 0;
    
        //End jump
        jumping = 0;
        
        //Jump again
        alarm[10] = 60
    }
}

//Jump fix
if (yspeed > 0)
&& (jumping == 1)
    jumping = 2;

//Set facing direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;