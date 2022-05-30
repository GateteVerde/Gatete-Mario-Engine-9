/// @description Golden Bowser Statue logic

//Inherit event
event_inherited();

//Set up the facing direction if in ground and make it jump again
if (yadd == 0) {

    //If the object jumped
    if (jumping == 2) {
    
        //Stop horizontal movement
        xspeed = 0;
    
        //End jump
        jumping = 0;
        
        //Jump again
        alarm[0] = 100;
    }
}

//Otherwise, end jump
else {
	
	//End jumping sequence
	if ((jumping == 1) && (yspeed > 0)) {
	
		//End jump
		jumping = 2;
		
		//Set default frame
		image_speed = 0;
		image_index = 0;
	}
	
	//Set facing direction
	if (xspeed > 0)
		xscale = 1;
	else if (xspeed < 0)
		xscale = -1;
}
