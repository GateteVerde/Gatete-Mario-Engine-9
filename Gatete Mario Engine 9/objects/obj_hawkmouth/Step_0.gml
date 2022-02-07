/// @description Hawkmouth Gate logic

//If the mouth is opening
if (ready == 2) {

    //Open it
    jaw_y += 0.3;
    
    //If the mouth is opened enough, wait for the player
    if (jaw_y > 12) {
    
        //Keep it open
        jaw_y = 12;
        
        //Wait until the player enters
        ready = 3;
    }
}

//Otherwise, if the mouth is closing
else if (ready == 4) {

    //Close it
    jaw_y -= 0.3;
    
    //If the mouth is closed enough, clear the level
    if (jaw_y < 0) {
    
        //Keep it closed
        jaw_y = 0;
        
        //Clear the level
        ready = 5;
    }
}

//Set horizontal scale of collision
if (instance_exists(mytop))
	mytop.image_xscale = xscale;