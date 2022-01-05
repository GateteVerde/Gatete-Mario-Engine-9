/// @description SMB2 Holdable Item logic (Player)

//If this object is being held.
if (held) {

    //If Mario does exist.
    if (instance_exists(obj_mario)) {
        
        //Force player hold
        obj_mario.holding = 1;
        
        //Make it visible
        visible = 1;
		
		//Stay in front
		depth = -6;
        
        //Snap onto Mario's x position
        x = obj_mario.x-8;
        
        //Snap onto the Mario's y position        
        if (obj_mario.crouch) { //If the player is crouched down.
        
            //If Mario is small.
            if (global.powerup == cs_small)
                y = obj_mario.y-9;
            else
                y = obj_mario.y-12;
        }
        
        //Otherwise, if it's not.
        else {
        
            //If Mario is small.
            if (global.powerup == cs_small)
                y = obj_mario.y-12;
            else
                y = obj_mario.y-20;
        }
    }
    
    //Otherwise
    else {
            
        //Check what object is holding first
        event_user(15);
        
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