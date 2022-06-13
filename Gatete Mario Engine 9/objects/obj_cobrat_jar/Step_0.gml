/// @description Jar Cobrat logic

//Handle pseudo movement variables
if (freeze == false) {

	y += yspeed;
	yspeed += yadd;
}

//If jumping and moving down
if ((jumping == 1) && (yspeed > 0)) {

    //Set the sprite
    sprite_index = spr_cobrat_jump;
    
    //Reset sprite
    alarm[2] = 32;
    
    //End jump
    jumping = 2;
    
    //Create pellet
    with (instance_create_depth(x+4*sign(xscale), y-7, -2, obj_snifit_pellet))
        xspeed = 1.5*sign(other.xscale);
}

//Otherwise, if moving down and nearby the start position
else if ((jumping == 2) && (y > ystart)) {

    //Set the vertical speed
	yspeed = 0;
	yadd = 0;
    
    //Stay on start position
    y = ystart;
    
    //Set offset variable
    ready = -1;
    
    //End jump
    jumping = 0;
    
    //Jump again
    alarm[1] = 100;
}
        
//Update offset
#region
	
	//If not jumping
	if (jumping == 0) {
	
		//Set y position
		y += 0.25*sign(ready);

		//Change the offset movement
		if (y < ystart-8)
		    ready = 1;
		else if (y > ystart)
		    ready = -1;
	}

#endregion

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;