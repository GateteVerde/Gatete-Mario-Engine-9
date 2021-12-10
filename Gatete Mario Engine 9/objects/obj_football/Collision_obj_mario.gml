/// @description Make the player interact with the item

//If the item is not held
if ((held == 0) && (kicked == false)) {
        
    //If the player can hold the item
	if (can_hold()) 
    && (other.bbox_bottom > bbox_top) {
    
        //Make the player hold it
        other.holding = 2;
        
        //Hold
        held = 1;
        
        //Stop movement
		xspeed = 0;
        yspeed = 0;
        yadd = 0;
    }
}