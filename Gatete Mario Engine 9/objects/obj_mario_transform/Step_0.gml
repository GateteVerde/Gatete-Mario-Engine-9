/// @description Set special grow state

if (sequence == 5) {

	//Increment scale
	scale += 0.0375;
	
	//Manage scale
	if (scale > 0) {
		
		//If the scale is greater than 4
		if (scale > 4) {
		
			//Set scale to 4
			scale = 4;
			
			//Delete snapshot
			sprite_delete(snapshot);
			
			//Activate all instances
			instance_activate_all();
			
			//Create timer
			instance_create_depth(0, 0, -5, obj_megashroom_timer);
        
	        //With the player
	        with (obj_mario) {
        
	            //Enable gravity
	            enable_gravity = true;
            
	            //Make visible
	            visible = true;
            
	            //Set alpha back to 1, but check first if the player is not doing a special action.
	            if (instance_exists(obj_puller))
	            || (instance_exists(obj_wallrunner))
	                image_alpha = 0;
	            else
	                image_alpha = 1;
	        }
        
	        //Destroy
	        instance_destroy();
		}
		
		//Set up frame
		if (scale > 1.75)
			image_index = 1;
		if (scale > 2.5)
			image_index = 2;
		if (scale > 3.25)
			image_index = 3;
	}
}

//Otherwise, if shrinking
else if (sequence == 6) {

	//Decrement scale
	scale -= 0.0375;
	
	//If scale is lower than 1
	if (scale < 1) {
	
		//Set scale to 4
		scale = 1;
		
		//Delete snapshot
		sprite_delete(snapshot);
		
		//Activate all instances
		instance_activate_all();
        
	    //With the player
	    with (obj_mario) {
        
	        //Enable gravity
	        enable_gravity = true;
            
	        //Make visible
	        visible = true;
			
			//Grant invincibility
			event_user(7);
            
	        //Set alpha back to 1, but check first if the player is not doing a special action.
	        if (instance_exists(obj_puller))
	        || (instance_exists(obj_wallrunner))
	            image_alpha = 0;
	        else
	            image_alpha = 1;
	    }
        
	    //Destroy
	    instance_destroy();		
	}
}