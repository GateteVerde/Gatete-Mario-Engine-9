/// @description Ninji logic

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
        sprite_index = spr_ninji_purple;
		image_speed = 0;
		image_index = 0;
        
        //End jump
        jumping = 0;
        
        //Jump again
        alarm[1] = 15+random(round(30));
    }
}

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;
