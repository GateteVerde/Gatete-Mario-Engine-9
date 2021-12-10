/// @description Make Mario interact with the item

//If the item is not being held
if (!held) {

    //If Mario is above and moving down, stomp the trampoline.
	if (other.yspeed > 0)
    && (other.bbox_bottom < bbox_top-yspeed+5) {
    
        //Animate
        image_speed = 0.4;
        
        //Player logic
        with (other) {
        
            //Stop horizontal movement
            xspeed = 0;
            
            //Stop vertical movement
            yspeed = 0;
            if (yadd > 0)
                yadd = 0;
        }
        
        //Trampoline is ready
        ready = 1;
        ready2 = 1;
        
        //Make sure to reset the player variables
        with (other) event_user(15);
    }
    
    //Otherwise, if the player can pick up the item
    else if (can_hold())
    && (ready2 == 0)
    && (inwall == false)
    && (other.bbox_bottom > bbox_top) {
    
        //Make the player hold it
        other.holding = 2;
		
		//Start timer
        if (ready3 == 0) {
        
            //Timer has started
            ready3 = 1;
            
            //Set up the timer
            if (time >= 2)
                alarm[1] = (time-2) * 60;
            else            
                alarm[1] = 1;
            
            //Destroy
            alarm[2] = time*60;
        }
        
        //Hold
        held = 1;
        
        //Stop movement
		xspeed = 0;
        yspeed = 0;
        yadd = 0;
    }
}

#region MARIO LOGIC

	//If the spring is ready
	if (ready == 1) {

	    //Set idle state
	    obj_mario.state = playerstate.idle;    
    
	    //Prevent Mario's gravity
	    obj_mario.disablegrav = 1;

	    //Prevent Mario from jumping.
	    obj_mario.jumping = 2;
    
	    //Stop sliding
	    obj_mario.sliding = 0;
        
	    //Set y position
	    obj_mario.y = self.y+(image_index*2)-14;
	}

#endregion