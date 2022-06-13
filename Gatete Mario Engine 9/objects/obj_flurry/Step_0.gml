/// @description Flurry logic

//Inherit event
event_inherited();
    
//Keep charging at the player
if (collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_bottom+1, obj_slippery, 0, 0)) {

	//Previous xspeed
	prevxspeed = xspeed;
	
    //Enable charge
    charge = 1;

    //If there's no gravity
    if (yadd == 0) {
        
		//If the direction changed, speed up
	    if (xspeed != prevxspeed) {
    
	        xspeed = sign(xspeed) * 1.5;
	    }
            
        //Follow Mario
        if (!instance_exists(obj_mario))
        || (obj_mario.x < x) {
            
            xspeed -= 0.05;
            if (xspeed < -1.5)
                xspeed = -1.5;
        }
        else {
            
            xspeed += 0.05;
            if (xspeed > 1.5)
                xspeed = 1.5;
        }
    }
}
else {

    //If charging...
    if (charge == 1) {
        
        //Turn towards the player
        alarm[11] = 60;
    
        //Stop charging
        charge = 0;
        
        //Set normal speed
        if (xspeed > 0)
            xspeed = 1;
        else if (xspeed < 0)
            xspeed = -1;
    }
}

//Face towards the player but only if in contact with a slippery surface
if (collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_bottom+1, obj_slippery, 0, 0)) {
    
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xscale = -1;
    else
        xscale = 1;
}
else {
	
	if (xspeed > 0)
		xscale = 1;
	else if (xspeed < 0)
		xscale = -1;
}