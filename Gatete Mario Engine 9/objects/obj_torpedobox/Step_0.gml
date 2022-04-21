/// @description Torpedo Launcher logic

//If Mario does not exist or it does exist and it's not transforming, deny event
if (instance_exists(obj_mario)) 
&& (!instance_exists(obj_mario_transform)) {

	//If the launcher is about to launch a torpedo
	if (ready == 1) {

	    //Move the hand down
	    gy += 0.5;
    
	    //If the hand is fully outta the box, drop the torpedo.
	    if (gy > 32) {
    
	        //Stop the hand
	        gy = 32;
        
	        //Launch the torpedo
	        ready = 2;
        
	        //Create torpedo with the given stats
	        with (instance_create_depth(x+16, y+48, -2, obj_torpedoted)) {
        
	            yspeed = 0.5;
	            xscale = other.gx;
	        }
	    }
	}

	//Otherwise, rise the hand and prepare another torpedo.
	else if (ready == 2) {

	    //Raise hand
	    gy -= 0.5;
    
	    //If the hand is fully inside the box, prepare another torpedo.
	    if (gy < 0) {
    
	        //Stop the hand
	        gy = 0;
        
	        //Prepare another torpedo
	        ready = 3;
        
	        //Launch another after 100 ticks
	        alarm[0] = 100;
	    }
	}
}

//Set the glove frame
if (ready < 2)
	gi = 0;
else
	gi = 1;
