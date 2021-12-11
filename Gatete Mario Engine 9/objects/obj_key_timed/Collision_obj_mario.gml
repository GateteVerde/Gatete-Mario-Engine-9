/// @description Make the player interact with the item

//If the item is not held
if (held == false) {
        
    //If the player can hold the item
	if (can_hold()) 
    && (inwall == false)
	&& (other.climbstyle == 0)
    && (other.bbox_bottom > bbox_top) {
    
        //Make the player hold it
        other.holding = 2;
		
		//Start timer
        if (ready3 == 0) {
        
            //Timer has started
            ready3 = 1;
            
            //Set up the timer
            if (time >= 2)
                alarm[0] = (time-2) * 60;
            else            
                alarm[0] = 1;
            
            //Destroy
            alarm[1] = time*60;
        }
        
        //Hold
        held = 1;
        
        //Stop movement
        yspeed = 0;
        yadd = 0;
    }
}