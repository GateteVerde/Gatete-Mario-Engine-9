/// @description Held Blue Boomerang logic (Player)

//If this object is being held.
if (held) {

    //If Mario does exist.
    if (instance_exists(obj_mario)) {
        
        //Force player hold
        obj_mario.holding = 3;
        
        //Make it visible
        visible = 1;
		
		//Stay in front
		depth = -2;
		
		//Scale
		xscale = obj_mario.xscale;
        
        //Snap onto the Mario's y position        
        if (obj_mario.crouch) { //If the player is crouched down.
			
			//Snap onto Mario's x position
			x = obj_mario.x;
        
            //If Mario is small.
            if (global.powerup == cs_small)
                y = obj_mario.y-9;
            else
                y = obj_mario.y-12;
        }
        
        //Otherwise, if it's not.
        else {
			
			//Snap onto Mario's x position
			x = obj_mario.x + (10 * obj_mario.xscale);
        
            //If Mario is small.
            if (global.powerup == cs_small)
                y = obj_mario.y-12;
            else
                y = obj_mario.y-23;
        }
    }
    
    //Otherwise
    else {
            
        //Check what object is holding first
        follow_which_mario();
        
        //Then check if it exists
        if (instance_exists(follow)) {
            
            //Set the position of the item.
            x = follow.x;
            y = follow.y;
            
            //Make it invisible.
            visible = 0;
            
            //Make said object hold the item
            follow.holding = 1;
            
            //Set up the item's sprite
            follow.myitem = sprite_index;
            
            //Set up the item's frame.
            follow.myframe = image_index;            
        }            
    }
	
	//If Mario does have the tiny, mega or balloon powerup
	if (global.powerup == cs_tiny)
	|| (global.powerup == cs_mega) 
	|| (instance_exists(obj_mario_balloon)) {
	
		held = false;
		if (obj_mario.holding > 0)
			obj_mario.holding = 0;
	}
    
    //Release if the player dies
    if (!instance_exists(obj_mario))
    && (follow == noone)
        held = false;
}