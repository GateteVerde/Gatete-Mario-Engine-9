/// @description Pinball Flipper logic

//If the flipper is facing right
if (image_angle == 0) {

	//If the flipper is not opened...
	if (ready < 2)

	//...and the player or a npc is on the opposite direction.
	&& ((collision_rectangle(bbox_right, bbox_top, bbox_right+4, bbox_bottom, obj_mario, 0, 0))
	|| (collision_rectangle(bbox_right, bbox_top, bbox_right+4, bbox_bottom, obj_physicsparent, 0, 0))) {

	    //Set the frame
	    image_index = 3;
    
	    //Close up the flipper if it's closed
	    if (ready == 0) {
    
	        ready = 1;
	        with (mysolid) {
        
	            x = xstart;
	            y = ystart;
	        }
	    }
	}

	//Otherwise, open up the flipper if the player or a npc is on place
	else if ((collision_rectangle(bbox_left-4, bbox_top, bbox_left, bbox_bottom, obj_mario, 0, 0))
	|| (collision_rectangle(bbox_left-4, bbox_top, bbox_left, bbox_bottom, obj_physicsparent, 0, 0))) {

	    //If the flipper is not fully opened.
	    if (ready != 2) {
    
	        //Play 'Kick 2' sound
	        audio_play_sound(snd_kick_2, 0, false);            
        
	        //Destroy solid mask
	        with (mysolid) {
        
	            x = -1000;
	            y = -1000;
	        }
        
	        //Open it
	        ready = 2;
        
	        //Change frame
	        alarm[0] = 2;
	        alarm[1] = 4;
	    }
	}

	//Otherwise, if the flipper is open and the player or npc goes to the opposite side.
	else if (ready == 2) 
	&& (!collision_rectangle(bbox_left-4, bbox_top, bbox_right, bbox_bottom, obj_mario, 0, 0)) 
	&& (!collision_rectangle(bbox_left-4, bbox_top, bbox_right, bbox_bottom, obj_physicsparent, 0, 0)) {

	    //Close up
	    ready = 3;
    
	    //Change frame
	    alarm[0] = 2;
	    alarm[2] = 4;
	}

	//Otherwise, if the flipper is fully closed
	else if (image_index == 3) {

	    //Set the frame
	    image_index = 0;    
    
	    //Make it solid
	    with (mysolid) {
    
	        x = xstart;
	        y = ystart;
	    }
	}
}

//Otherwise, if the flipper is facing up
else if (image_angle == 90) {

	//If the flipper is not opened...
	if (ready < 2)

	//...and the player or a npc is on the opposite direction.
	&& ((collision_rectangle(bbox_left, bbox_top-4, bbox_right, bbox_top+1, obj_mario, 0, 0))
	|| (collision_rectangle(bbox_left, bbox_top-4, bbox_right, bbox_top+1, obj_physicsparent, 0, 0))) {

	    //Set the frame
	    image_index = 3;
    
	    //Close up the flipper if it's closed
	    if (ready == 0) {
    
	        ready = 1;
	        with (mysolid) {
        
	            x = xstart;
	            y = ystart;
	        }
	    }
	}

	//Otherwise, open up the flipper if the player or a npc is on place
	else if ((collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+8, obj_mario, 0, 0))
	|| (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+8, obj_physicsparent, 0, 0))) {

	    //If the flipper is not fully opened.
	    if (ready != 2) {
    
	        //Play 'Kick 2' sound
	        audio_play_sound(snd_kick_2, 0, false);            
        
	        //Destroy solid mask
	        with (mysolid) {
        
	            x = -1000;
	            y = -1000;
	        }
        
	        //Open it
	        ready = 2;
        
	        //Change frame
	        alarm[0] = 2;
	        alarm[1] = 4;
	    }
	}

	//Otherwise, if the flipper is open and the player or npc goes to the opposite side.
	else if (ready == 2) 
	&& (!collision_rectangle(bbox_left, bbox_top-8, bbox_right, bbox_bottom, obj_mario, 0, 0)) 
	&& (!collision_rectangle(bbox_left, bbox_top-8, bbox_right, bbox_bottom, obj_physicsparent, 0, 0)) {

	    //Close up
	    ready = 3;
    
	    //Change frame
	    alarm[0] = 2;
	    alarm[2] = 4;
	}

	//Otherwise, if the flipper is fully closed
	else if (image_index == 3) {

	    //Set the frame
	    image_index = 0;    
    
	    //Make it solid
	    with (mysolid) {
    
	        x = xstart;
	        y = ystart;
	    }
	}	
}

//Otherwise, if the flipper is facing left
else if (image_angle == 180) {
	
	//If the flipper is not opened...
	if (ready < 2)

	//...and the player or a npc is on the opposite direction.
	&& ((collision_rectangle(bbox_left-1, bbox_top, bbox_left, bbox_bottom, obj_mario, 0, 0))
	|| (collision_rectangle(bbox_left-1, bbox_top, bbox_left, bbox_bottom, obj_physicsparent, 0, 0))) {

	    //Set the frame
	    image_index = 3;
    
	    //Close up the flipper if it's closed
	    if (ready == 0) {
    
	        ready = 1;
	        with (mysolid) {
        
	            x = xstart;
	            y = ystart;
	        }
	    }
	}

	//Otherwise, open up the flipper if the player or a npc is on place
	else if ((collision_rectangle(bbox_right, bbox_top, bbox_right+4, bbox_bottom, obj_mario, 0, 0))
	|| (collision_rectangle(bbox_right, bbox_top, bbox_right+4, bbox_bottom, obj_physicsparent, 0, 0))) {

	    //If the flipper is not fully opened.
	    if (ready != 2) {
    
	        //Play 'Kick 2' sound
	        audio_play_sound(snd_kick_2, 0, false);            
        
	        //Destroy solid mask
	        with (mysolid) {
        
	            x = -1000;
	            y = -1000;
	        }
        
	        //Open it
	        ready = 2;
        
	        //Change frame
	        alarm[0] = 2;
	        alarm[1] = 4;
	    }
	}

	//Otherwise, if the flipper is open and the player or npc goes to the opposite side.
	else if (ready == 2) 
	&& (!collision_rectangle(bbox_left-1, bbox_top, bbox_right+4, bbox_bottom, obj_mario, 0, 0)) 
	&& (!collision_rectangle(bbox_left-1, bbox_top, bbox_right+4, bbox_bottom, obj_physicsparent, 0, 0)) {

	    //Close up
	    ready = 3;
    
	    //Change frame
	    alarm[0] = 2;
	    alarm[2] = 4;
	}

	//Otherwise, if the flipper is fully closed
	else if (image_index == 3) {

	    //Set the frame
	    image_index = 0;    
    
	    //Make it solid
	    with (mysolid) {
    
	        x = xstart;
	        y = ystart;
	    }
	}
}

//Otherwise, if the flipper is facing down
else if ((image_angle == -90) || (image_angle == 270)) {
	
	//If the flipper is not opened...
	if (ready < 2)

	//...and the player or a npc is on the opposite direction.
	&& ((collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_bottom+4, obj_mario, 0, 0))
	|| (collision_rectangle(bbox_left, bbox_bottom-1, bbox_right, bbox_bottom+4, obj_physicsparent, 0, 0))) {

	    //Set the frame
	    image_index = 3;
    
	    //Close up the flipper if it's closed
	    if (ready == 0) {
    
	        ready = 1;
	        with (mysolid) {
        
	            x = xstart;
	            y = ystart;
	        }
	    }
	}

	//Otherwise, open up the flipper if the player or a npc is on place
	else if ((collision_rectangle(bbox_left, bbox_top-8, bbox_right, bbox_top, obj_mario, 0, 0))
	|| (collision_rectangle(bbox_left, bbox_top-8, bbox_right, bbox_top, obj_physicsparent, 0, 0))) {

	    //If the flipper is not fully opened.
	    if (ready != 2) {
    
	        //Play 'Kick 2' sound
	        audio_play_sound(snd_kick_2, 0, false);            
        
	        //Destroy solid mask
	        with (mysolid) {
        
	            x = -1000;
	            y = -1000;
	        }
        
	        //Open it
	        ready = 2;
        
	        //Change frame
	        alarm[0] = 2;
	        alarm[1] = 4;
	    }
	}

	//Otherwise, if the flipper is open and the player or npc goes to the opposite side.
	else if (ready == 2) 
	&& (!collision_rectangle(bbox_left, bbox_top-8, bbox_right, bbox_bottom, obj_mario, 0, 0)) 
	&& (!collision_rectangle(bbox_left, bbox_top-8, bbox_right, bbox_bottom, obj_physicsparent, 0, 0)) {

	    //Close up
	    ready = 3;
    
	    //Change frame
	    alarm[0] = 2;
	    alarm[2] = 4;
	}

	//Otherwise, if the flipper is fully closed
	else if (image_index == 3) {

	    //Set the frame
	    image_index = 0;    
    
	    //Make it solid
	    with (mysolid) {
    
	        x = xstart;
	        y = ystart;
	    }
	}	
}