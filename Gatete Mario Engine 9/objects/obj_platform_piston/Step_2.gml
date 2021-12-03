/// @description Piston Platform logic

//Inherit the parent event
event_inherited();

//If the parent object exists
if (instance_exists(parent)) {

	//Check for Mario
	if (collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0))
	&& (obj_mario.state < playerstate.jump)
	&& (obj_mario.bbox_bottom < yprevious+5) {

		//Make the platform go down
		vspeed = 0.5;
	
		//Make the other platform go upwards
		with (parent) vspeed = -0.5;
	}

	//Otherwise, return both platforms to the start position
	else if (!collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0)) 
	&& (!collision_rectangle(parent.bbox_left, parent.bbox_top-5, parent.bbox_right, parent.bbox_top+4, obj_mario, 0, 0)) {

	    //If the platform is above the y start position
	    if (y < ystart) {
        
	        //Set the vertical speed
	        vspeed = 0.25;
            
	        //Set the parent vertical speed
	        with (parent) vspeed = -0.25;
	    }
        
	    //Otherwise, if the platform is below the y start position
	    else if (y > ystart) {
        
	        //Set the vertical speed
	        vspeed = -0.25;
            
	        //Set the parent vertical speed
	        with (parent) vspeed = 0.25;    
	    }
	}
}