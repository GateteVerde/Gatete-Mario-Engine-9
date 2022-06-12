/// @description Chaser Ninji logic

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

    //If the Ninji jumped...
    if (jumping == 2) {
    
        //Animate
		sprite_index = spr_ninji_purple
        image_speed = 1;
        
        //End jump
        jumping = 0;
    }
    
    //Otherwise
    else if (jumping == 0)
    && (instance_exists(obj_mario)) {
    
        //If Mario is nearby a ninji and jumps, make ninji jump.
        if (obj_mario.jumping > 0)
		&& (obj_mario.x > bbox_left-48)
		&& (obj_mario.x < bbox_right+48) {
        
            //Jump
            yspeed = (swimming) ? -2 : -4;
            
            //Boost jump
            y--;
            
            //Jump
            jumping = 1;
        
            //Stop animation
			sprite_index = spr_ninji_purple_jump;
        }
    }
}

//Face towards direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;