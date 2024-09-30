/// @description Increment alpha until the screen is faded completely

//If the object is fadeing in
if (fade == 0) {

	//Fade in
	alpha += 0.04;

	//Go to the destination room
	if (alpha > 1) {

	    //Set up the alpha
	    alpha = 1;
		
		//Delete sprite
	    sprite_delete(snapshot);
    
	    //Activate all instances
	    instance_activate_all();
	
		//Set fade mode
		fade = 1;
	}
}

//Otherwise
else if (fade == 1) {

	//Fade out
	alpha -= 0.04;

	//Destroy the object
	if (alpha < 0)
	    instance_destroy();
}