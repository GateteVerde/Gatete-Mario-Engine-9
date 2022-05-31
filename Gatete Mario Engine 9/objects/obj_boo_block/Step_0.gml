/// @description Boo Block logic

//Inherit event from parent
event_inherited();

#region ANIMATION

	//If not moving
	if (movenow == 0) {
		
		//Increment frame
		if (frame == 0) {
		
			frame = 1;
		}
		
		//Increment frame
		frame += 0.125;
		if (frame > sprite_get_number(sprite_index))
			frame = sprite_get_number(sprite_index) - .01;
	} 
	
	//Otherwise, if the boo is not moving
	else {
		
		//Decrement frame
	    frame -= 0.025;
		
		//Prevent from looping
	    if (frame <= 0)
	        frame = 0;	   
	}

	#region MANAGE SOLID
	
		//If the boo is moving, destroy the solid
		if (floor(frame) == 0) {
			
			//If the solid exists
			if (instance_exists(mysolid))
				with (mysolid) instance_destroy();
		}
		
		//Otherwise, if the boo is not longer moving, create a new solid
		else if (floor(frame) > 0) {
		
			//IF the solid does not exist
			if (!instance_exists(mysolid))
				mysolid = instance_create_layer(x-8, y, "Main", obj_solid);
		}
	#endregion
    
	//Set stomp flag
	if (instance_exists(mysolid))
	    stomp = -1;
	else 
	    stomp = 2;
#endregion

//Move the solid
if (instance_exists(mysolid)) {

    with (mysolid) {
    
        x = other.x-8;
        y = other.y;
    }
}
