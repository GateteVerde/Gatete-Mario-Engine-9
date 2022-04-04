/// @description Jumping piranha plant logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//No gravity
yadd = 0;

#region LOGIC

	//If the piranha plant jumped outside the pipe
	if (ready == 0)
	&& (y < ystart-16) {

	    //Cap vertical speed
	    if (yspeed > 0.5) {
    
	        yspeed = 0.5;
	        ready = 1;
	    }
    
	    //Slowdown till the plant stops
	    yspeed += 0.025;
    
	    //If the piranha plant has stopped
	    if (yspeed == 0) {
    
	        //If the piranha plant can shoot fireballs, do so
	        if (fire == 0) && (type != 0) {
        
	            //Fire
	            fire = 1;
	            alarm[1] = 1;
	        }
	    }
	}

	//Otherwise, if the piranha plant is descending and it's entering the pipe.
	else if ((ready == 1) && (y > ystart)) {

	    //Snap in position
	    yspeed = 0;
	    y = ystart;
    
	    //Jump again
	    alarm[0] = 60;
    
	    //Allow to jump
	    ready = 0;
    
	    //Allow to fire again
	    fire = 0;
	}
#endregion

//Set sprite
if (type == 0)
	sprite_index = spr_jumpingpiranhaplant;
else {

	if ((fire == 0) && (yspeed > -0.5))
		sprite_index = spr_jumpingpiranhaplant_red_fire;
	else
		sprite_index = spr_jumpingpiranhaplant_red;
}
