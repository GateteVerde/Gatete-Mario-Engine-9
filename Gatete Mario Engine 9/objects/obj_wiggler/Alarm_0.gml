/// @description Move towards Mario

if (state == 1) {
	
	//Set hor. speed
	xspeed = (swimming) ? 0.5 * sign(xscale) : 1 * sign(xscale);
		
	//Change state
	state = 2;

	//Resume animation
	image_speed = 1;
	for (i=1; i < seg; i++) {
		
		mybody[i].image_speed = 1;
	}
		
	//Chase player cycle
	alarm[0] = 40;
}

//If mad, turn towards Mario
else {
	
	//If Mario does exist
	if (instance_exists(obj_mario)) {

	    //If Mario is at the left and the Wiggler is moving right
	    if ((obj_mario.x < x) && (xspeed > 0)) {
    
	        xspeed = (swimming) ? -0.5 : -1;
	        alarm[0] = 40;
	    }
    
	    //Otherwise, if Mario is at the right and the Wiggler is moving left
	    else if ((obj_mario.x > x) && (xspeed < 0)) {
    
	        xspeed = (swimming) ? 0.5 : 1;
	        alarm[0] = 40;
	    }
		else {
			
			alarm[0] = 40;
			exit;
		}
	}
	else	
		alarm[0] = 1;
}
