/// @description Cheep Cheep logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

#region LOGIC

	//Find water
	water = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_swim, 0, 0);

	//If there's a body of water
	if (water) {
    
	    //If the cheep makes contact with water.
	    if ((y > water.y-4) && (yspeed > 0)) {
    
	        //Snap to position.
	        y = water.y-4;
        
	        //Jump
	        yadd = 0.2;
	        if (jumping < 3) {
        
	            //Set the vertical speed.
	            yspeed = -3;
            
	            //Increment jump
	            jumping++;
	        }
	        else if (jumping == 3) {
        
	            //Set the vertical speed.
	            yspeed = -6;
            
	            //Repeat the jump cycle.
	            jumping = 0;
	        }
	    }
	}
	
#endregion

//Cap vertical speed
if (yspeed > 4) {

	yspeed = 4;
	yadd = 0;
}

//Facing direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
    xscale = -1;
