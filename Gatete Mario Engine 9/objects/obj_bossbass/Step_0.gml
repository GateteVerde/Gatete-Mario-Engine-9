/// @description Boss Bass logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

#region LOGIC

	//If Mario does exist and the boss bass has not jumped yet.
	if (instance_exists(obj_mario)) 
	&& (jumping == 0) {

	    //If the boss bass has not jumped and Mario is nearby.
	    if (obj_mario.x > x-32) 
	    && (obj_mario.x < x+32) {
			
			//Set jumping sprite
			sprite_index = spr_bossbass_jump;
    
	        //Make it jump
	        jumping = 1;
        
	        //Set the vertical speed
	        yspeed = -4;
	        yadd = 0.2;
        
	        //Set the horizontal speed.
	        xspeed = 1.25*sign(xscale);
	    }
	}

	//Otherwise, look for a nearest water surface and allow the boss bass to jump.
	else {

	    //Find a nearby body of water
	    water = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_swim,0,0);
    
	    //If there's a body of water
	    if (water) {
    
	        //If the boss bass has jumped out of the water.
	        if (jumping == 1) {
        
	            //If the boss bass makes contact with water.
	            if ((y > water.y+12) && (yspeed > 0)) {
					
					//If the Boss Bass did not ate Mario
					if (fud == noone) {
					
						sprite_index = spr_bossbass;
					}
            
	                //Snap to position.
	                y = water.y+12;
                
	                //Stop vertical speed
	                yspeed = 0;
	                yadd = 0;
                
	                //Disallow jumping
	                jumping = 2;
                
	                //Allow jumping
	                alarm[0] = 24;
                
	                //Cap horizontal speed
	                xspeed = 2.5*sign(xscale);
	            }
	        }
	    }
	}

	//Chase Mario
	if (jumping == 0) {

	    //If Mario does not exists or it's at the left
	    if (!instance_exists(obj_mario))
	    || (obj_mario.x < x) {
    
	        xspeed -= 0.1;
	        if (xspeed < -2.5)
	            xspeed = -2.5;    
	    }
    
	    //Otherwise, go to the right
	    else if (obj_mario.x > x) {
    
	        xspeed += 0.1;
	        if (xspeed > 2.5)
	            xspeed = 2.5;
	    }
	}
	
	//Make sure it does not exit the view boundaries
    if (x < camera_get_view_x(view_camera[0]) - 32)
        x = camera_get_view_x(view_camera[0]) - 32;
    else if (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 32)
        x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 32;
	
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
