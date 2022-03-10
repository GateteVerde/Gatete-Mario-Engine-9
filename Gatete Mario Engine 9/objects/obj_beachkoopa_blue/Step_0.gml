/// @description Blue Beach Koopa logic

#region HOLDING

	//If the kicked object does not exist or left the kicker away
	if (sprite_index != spr_beachkoopa_blue_kick)
	&& (idd)
	&& (!collision_rectangle(bbox_left-21, bbox_top-8, bbox_right+21, bbox_bottom+21, idd, 1, 0)) {

	    //Remove ID
	    idd = noone;
    
	    //Walk as normal
	    alarm[2] = 20;
	    xspeed = 0;
    
	    //Set funny sprite
	    sprite_index = spr_beachkoopa_blue;
    
	    //Exit event
	    exit;
	}
	
	//Otherwise
	else if (idd) {

	    if ((kicky > 1) && (kicky < 4)) {
        
	        //Accelerate, if there is no gravity
	        if (yadd == 0)
	            xspeed += 0.11*xscale;
    
	        //If it hits max speed
	        if ((xspeed >= 0.5) && (xscale == 1))
	        || ((xspeed <= -0.5) && (xscale == -1)) {
        
	            //Stop
	            xspeed = 0;
            
	            //Kick
	            alarm[3] = 15;
            
	            //Change kick state 
	            kicky = 999;
	        } 
        
	        //Dribble item 
	        if ((idd.yadd == 0))
	        && ((xspeed >= 0) && (xscale == 1) || (xspeed <= 0) && (xscale == -1)) 
	        && (yadd == 0)
	           idd.yspeed = -0.6;
        
	        //Drag shell
	        idd.xspeed = xspeed;
        
	    }
    
	    //Stop or slow shell animation
	    if (idd.object_index == obj_shell_kicked) {
    
	        //slow image speed animation
	        idd.image_speed = max(0, abs(idd.image_speed)-0.007)*sign(idd.image_speed);
	    }
    
	    //Move away from item
	    if (initem) { 
    
	        //Shift pixels depending on direction it wants to go
	        x -= 3*dir;
        
	        //Declare initem false if koopa is no longer overlapping the held item
	        if (!collision_rectangle(bbox_left, bbox_top-7, bbox_right, bbox_bottom+4, idd, 0, 0))
	            initem = false;
	    }
	}
#endregion

//If not sliding
if (slide == 0) {
	
	//Manage ledge turning
	#region LEDGE TURNING
	
		if (ready == 2)
		&& (kicky == 0)
		&& (slide == 0)
			turn_on_ledges = true;
		else
			turn_on_ledges = false;
	
	#endregion
	
	//Inherit event from parent
	event_inherited();

	//Sliding logic
	if (ready == 0) {
    
	    //If the koopa is about to stop
	    if (xspeed < 0.05) 
	    && (xspeed > -0.05) {
        
	        //Stop it
	        xspeed = 0;
        
	        //Allow movement
	        ready = 1;
        
	        //Start moving
	        alarm[10] = 30;
	    }
	}

	//Decelerate when sprite changes to sliding 
	if (sprite_index == spr_beachkoopa_blue) {
		
	    if (yadd == 0) 
			xspeed = max(0,abs(xspeed)-0.09)*sign(xspeed);
	}

	//If the koopa just came out from the shell, do not allow it to enter.
	if (sprite_index == spr_beachkoopa_blue_walk)
	&& (ready == 1)
	&& (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom-4, obj_shell, 0, 0))
	    ready = 2;

	//Otherwise, check for holdable items to kick
	if (ready == 2) && (!slide) {
    
	    //Check for an object
	    var obj = collision_rectangle(x+(boxl*sign(xscale)), bbox_top+boxt, x+(boxr*sign(xscale)), bbox_bottom+boxb, obj_shell, 0, 0);
	    var kicked = collision_rectangle(x+(boxl*sign(xscale)), bbox_top+boxt, x+(boxr*sign(xscale)), bbox_bottom+boxb, obj_shell_kicked, 0, 0);
    
	    //If there's an object in position
	    if (obj) 
	    && (obj.held == 0)
	    && (kicky == 0)
	    && (obj.sprite_height < 17){
    
	        //If object isn't moving at all
	        if (obj.xspeed == 0) {
        
	            //Kick state
	            kicky = 1;
            
	            //Get object ID
	            idd = obj.id;
            
	            //Check for overlapping item
	            if (collision_rectangle(bbox_left-3, bbox_top-4, bbox_right+3, bbox_bottom+4, idd, 0, 0)) { 
                
	                if (collision_line(x, y, x+23*xscale, y, obj_solid, 0, 0)) {
                
	                    //Make the koopa change position
	                    initem = true;
	                    dir = 1*sign(xscale);
	                }
	                else 
						idd.x = x+12*xscale;
	            }
            
	            //Stop
	            xspeed = 0;
				image_speed = 0;
	            image_index = 1;
            
	            //PUNT
	            alarm[3] = 15;
	        }
        
	        //Otherwise, accelerate 
	        else {
        
	            //Get object ID
	            idd = obj.id;
            
	            //Check for overlapping item
	            if (collision_rectangle(bbox_left-3, bbox_top-4, bbox_right+3, bbox_bottom+4, idd, 0, 0)) { 
                
	                if (collision_line(x, y, x+23*xscale, y, obj_solid, 0, 0)) {
                
	                    //Make the koopa change position
	                    initem = true;
	                    dir = 1*sign(xscale);
	                }
	                else 
						idd.x = x+12*xscale;
	            }
            
	            //Stop
	            xspeed = idd.xspeed;
				image_speed = 0;
	            image_index = 1;
	            
	            //Kick state
	            kicky = 3;
	        } 
	    }
    
	    //If object is a moving shell
		else if (kicked) 
	    && (kicky == 0)
	    && (kicked.sprite_height < 17)
	    && (idd == noone) {
    
	        //Get object ID
	        idd = kicked.id;
        
	        //Check for overlapping item
	        if (collision_rectangle(bbox_left-2, bbox_top-4, bbox_right+2, bbox_bottom+4, idd, 0, 0)) { 
                
	            if (collision_line(x, y, x+26*xscale, y, obj_solid, 0, 0)) {
            
	                //Make the koopa change position
	                initem = true;
	                dir = 1*sign(xscale);
	            }
	            else 
					idd.x = x+12*xscale;
	        }
        
	        //Stop
	        xspeed = idd.xspeed;
	        image_speed = 0; 
	        image_index = 1;
        
	        //Kick state
	        kicky = 2;
	    }        
	}

	//Set facing direction
	if (kicky == 0) {

	    if (xspeed > 0)
	        xscale = 1;
	    else if (xspeed < 0)
	        xscale = -1;   
	}
}

//Otherwise, if sliding
else {

	//Do not turn on ledges
	turn_on_ledges = false;
	
	//Inherit the parent event
	event_inherited();
        
    //Check for a slope
    slope_below = collision_rectangle(x-2, bbox_bottom+1, x+2, bbox_bottom+2, obj_slopeparent, 1, 0);
    
    //If there's a slope below the player
    if (slope_below)
        xspeed += (slope_below.add)/5;
    
    //Otherwise, if there's not a slope below
    else if (yspeed == 0) {
    
        //If the player is not overlapping a slippery surface
        if (!collision_rectangle(bbox_left, bbox_bottom-8, bbox_right, bbox_bottom+1, obj_slippery, 1, 0)) {
        
            //Reduce player's horizontal speed
            xspeed = max(0, abs(xspeed)-0.05)*sign(xspeed);
            
            //Set horizontal speed to 0 when the horizontal speed hits value in 'dec'.
            if (xspeed < 0.05)
            && (xspeed > -0.05) {
            
                //Stop horizontal movement
                xspeed = 0;
                
                //Stop slide
                slide = false;
                
                //Animate 
                image_speed = 0.15;
                
                //Walk
                alarm[10] = 25;
            }
        }
        
        //Otherwise, if the player is overlapping a slippery surface
        else {
        
            //Reduce player's horizontal speed yet slower
            xspeed = max(0, abs(xspeed)-0.0125)*sign(xspeed);
            
            //Set horizontal speed to 0 when the horizontal speed hits value in 'dec/8'.
            if (xspeed < 0.0125)
            && (xspeed > -0.0125) {
            
                //Stop horizontal movement
                xspeed = 0;
                            
                //Stop slide
                slide = false;
                
                //Animate 
                image_speed = 1;
                
                //Walk
                alarm[10] = 25;
            }     
        }
    }
	
    //If the horizontal speed is greater than the target speed, cap it
    if (xspeed > 2.4)
        xspeed = 2.4;
        
    //Otherwise, if the horizontal speed is lower than the target speed, cap it
    if (xspeed < -2.4)
        xspeed = -2.4;
}