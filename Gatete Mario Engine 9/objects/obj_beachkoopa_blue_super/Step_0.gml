/// @description Blue Super Koopa Logic

//If not flying
if (jumping < 2) {

    //Inherit event
    event_inherited();
    
    //If jumping
    if (jumping == 1) 
    && (yspeed > 0)
    && (y > jumpy-16) {
    
        //Stay in position
        jumping = 2;
        y = jumpy-16;
        
        //Stop vertical movement
        yspeed = 0;
        yadd = 0;
    }
}

//Otherwise, if flying
else if (jumping == 2) {

	//If not frozen
	if (freeze == false) {
	
		x += xspeed;
		y += yspeed;
	}
}

//Set the scale
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;