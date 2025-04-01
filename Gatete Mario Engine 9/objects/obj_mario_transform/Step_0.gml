/// @description Set special grow state

//Y Scale
image_yscale = image_xscale;

if (sequence == 5) {

	//Increment scale
	image_xscale += 0.0375;
	
	//Manage scale
	if (image_xscale > 0) {
		
		//If the scale is greater than 4
		if (image_xscale > 4) {
			
			//Play 'Here I Go' sound
			audio_play_sound(global.voiceline_hereigo, 0, false);
		
			//Set scale to 4
			image_xscale = 4;
			
			//Create timer
			instance_create_depth(0, 0, -5, obj_megashroom_timer);
        
	        //With the player
	        with (obj_mario) {
        
	            //Enable gravity
	            enable_gravity = true;
            
	            //Make visible
	            visible = true;
            
	            //Set alpha back to 1, but check first if the player is not doing a special action.
	            if (instance_exists(obj_mario_puller))
	            || (instance_exists(obj_mario_wallrunner))
	                image_alpha = 0;
	            else
	                image_alpha = 1;
	        }
        
	        //Destroy
	        instance_destroy();
		}
		
		//Set up frame
		if (image_xscale > 1.75)
			image_index = 1;
		if (image_xscale > 2.5)
			image_index = 2;
		if (image_xscale > 3.25)
			image_index = 3;
	}
}

//Otherwise, if shrinking
else if (sequence == 6) {

	//Decrement scale
	image_xscale -= 0.0375;
	
	//If scale is lower than 1
	if (image_xscale < 1) {
		
		//Set 'Big' powerup
		global.powerup = cs_big;
	
		//Set scale to 1
		image_xscale = 1;
        
	    //With the player
	    with (obj_mario) {
        
	        //Enable gravity
	        enable_gravity = true;
            
	        //Make visible
	        visible = true;
            
	        //Set alpha back to 1, but check first if the player is not doing a special action.
	        if (instance_exists(obj_mario_puller))
	        || (instance_exists(obj_mario_wallrunner))
	            image_alpha = 0;
	        else
	            image_alpha = 1;
	    }
        
	    //Destroy
	    instance_destroy();		
	}
}

//Make Mario stay in-position and update palette
if (instance_exists(obj_mario)) {

	obj_mario.x = x;
	obj_mario.y = y;
	isflashing = obj_mario.isflashing;
}