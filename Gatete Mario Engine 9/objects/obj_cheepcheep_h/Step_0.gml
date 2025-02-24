/// @description SMW Cheep Cheep logic

//Inherit event
event_inherited();

//If not flopping
if (swimming == 1) {

    //If the turning endpoint has not been set
    if (prevswim == 0) {
    
        xspeed = 0.5*sign(xscale);
        prevswim = 1;
        xx = x;
    }

    //Set the sprite
    sprite_index = (fish == 1) ? spr_letterfish : spr_cheepcheep;
	
	//Animate
	image_speed = 1;
    
    //Do not apply gravity
    yspeed = 0;
    yadd = 0;
    
    //If the cheep cheep is moving to the right.
    if (xspeed > 0) {
        
        //Change direction
        if (x > xx+32)
            xspeed = -xspeed;
    }
    
    //Otherwise, if the cheep cheep is moving to the left.
    else if (xspeed < 0) {
            
        //Change direction.
        if (x < xx-32)    
            xspeed = -xspeed;
    }
	
	//Face towards direction
	if (xspeed > 0)
		xscale = 1;
	else if (xspeed < 0)
		xscale = -1;
}

//Otherwise, if flopping
else if (swimming == 0) {

    //Reset turning endpoint
    prevswim = 0;

    //Set the flopping sprite
    sprite_index = (fish == 1) ? spr_letterfish_flop : spr_cheepcheep_flop;
    
    //Do not animate
    image_speed = 0;
    
    //If no gravity
    if (yadd == 0) {
    
        //Change frame
        image_index = !image_index;
    
        //Choose flop and therefore set the horizontal speed
        flopdir = choose(1, -1);
        xspeed = 1*sign(flopdir);
        
        //Set the vertical speed
        yspeed = -2;
    }
    
    //Set facing direction
    xscale = flopdir;    
}

//Set vulnerability
stomp = (swimming == 1) ? 2 : 0;