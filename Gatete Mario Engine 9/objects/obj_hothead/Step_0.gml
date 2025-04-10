/// @description Hot Head logic

#region LOGIC

	//If moving clockwise
	if (speed > 0) {

	    //Check if there's no floor on the way.
	    if (place_meeting(x + lengthdir_x(speed + 1, direction - 90), y + lengthdir_y(speed + 1, direction - 90), obj_solid) == false) {
		
	        //Rotate
	        direction -= 90;
        
	        //Make sure it's all the way onto the next side before doing any collision checks.
	        x += hspeed;
	        y += vspeed;
        
	        //Make contact with the new surface
	        move_contact_object(direction - 90, speed, obj_solid);
	    }
    
	    //Otherwise, check if he ran into a wall.
	    else if (place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), obj_solid)) {
            
	        //Rotate it so it's moving up the wall.
	        direction += 90;
        
	        //Make full contact with the wall.
	        move_contact_object(direction - 90, speed, obj_solid);
	    }
	}

	//Assuming that the spiny is moving left and on the ground
	if (speed < 0) {

	    //This checks *below* the spiny since you're double negating the direction... It's confusing but it works.
	    if (place_meeting(x + lengthdir_x(speed - 1, direction + 90), y + lengthdir_y(speed - 1, direction + 90), obj_solid) == false) {
    
	        //Rotate
	        direction += 90;
        
	        //Make sure it's all the way onto the next side before doing any collision checks.
	        x += hspeed;
	        y += vspeed;
        
	        //Make contact with the new surface
	        move_contact_object(direction + 90, speed, obj_solid);
	    }
    
	    //Otherwise, check if he ran into a wall.
	    else if (place_meeting(x + lengthdir_x(speed, direction), y + lengthdir_y(speed, direction), obj_solid)) {
             
	        //Rotate it so it's moving up the wall.
	        direction -= 90;
        
	        //Make full contact with the wall.
	        move_contact_object(direction + 90, speed, obj_solid);
	    }
	}

	//Obtain xspeed, yspeed values
	if (speed != 0) {
	
		xspeed = hspeed;
		yspeed = vspeed;
	}
#endregion

//Generate light
event_user(15);

//Set vertical facing direction
if (vspeed > 0)
    yscale = 1;
else if (vspeed < 0)
    yscale = -1;
    
//Set horizontal facing direction
if (hspeed > 0)
    xscale = 1;
else if (hspeed < 0)
    xscale = -1;
