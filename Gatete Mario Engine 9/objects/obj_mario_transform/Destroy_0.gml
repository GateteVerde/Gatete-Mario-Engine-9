/// @description Make the player visible

//Make all objects under obj_physicsparent resume movement
with (obj_physicsparent) event_user(14);
with (obj_platformparent) event_user(14);

//If the player is not riding anything
if (global.mount == 0) {
	
	//If Mario exists
	if (instance_exists(obj_mario)) {
    
	    //If the player is pulling an item, make said object visible
	    if (instance_exists(obj_mario_puller))    
	        obj_mario_puller.visible = true;
        
	    //Otherwise, if the wallrunner exists make said object visible
	    else if (instance_exists(obj_mario_wallrunner))    
	        obj_mario_wallrunner.visible = true;
        
	    //Otherwise, make the main player visible
	    else {
			
			//Un-freeze and give temporary invincibility
			with (obj_mario) {
				
				//Do give temporary invincibility if not in mega form
				if (global.powerup != cs_mega) {
				
					event_user(7);
				}
			
				//Un-freeze Mario
				event_user(14);
				
				//Enable control on Mario
				enable_control = true;
			}

			//Set depth and alpha
			obj_mario.depth = -5;
	        obj_mario.image_alpha = 1;
		}
	}
}
    
//If the player is riding a yoshi, make yoshi visible.
if (global.mount == 1) {
	
	//Make Yoshi visible
    obj_yoshi.visible = true;
	
	//Un-freeze
	with (obj_mario) {
				
		event_user(14);
		enable_control = true;
	}	
}

//Otherwise, if the player is riding a kuribo shoe, make the kuribo shoe visible.
else if (global.mount == 2) {
	
	//Make the kuribo shoe visible
    obj_kuriboshoe.visible = true;
	
	//Un-freeze
	with (obj_mario) {
				
		event_user(14);
		enable_control = true;
	}	
}