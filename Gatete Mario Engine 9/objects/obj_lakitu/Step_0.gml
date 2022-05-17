/// @description Lakitu logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
}

//Set depth
depth = -6;

//If Mario does exist
if (instance_exists(obj_mario)) {

	//If the object to follow is inside the spawn area.
	if (obj_mario.x > xmin)
	&& (obj_mario.x < xmax) {
    
	    //If the object to follow is at the right, move to the right.    
	    if (obj_mario.x > x) {
        
	        xspeed += 0.0324;
	        if (xspeed > 2)
	            xspeed = 2;
	    }
        
	    //Otherwise, move to the left.
	    else if (obj_mario.x < x) {
        
	        xspeed += -0.0324;
	        if (xspeed < -2)
	            xspeed = -2;
	    }
		
		//Stay in view
	    if (x < camera_get_view_x(view_camera[0]) - 16)
	        x = camera_get_view_x(view_camera[0]) - 16;
	    if (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 16)
	        x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 16;
	}
    
	//Otherwise if it's outside, move outside the view.
	else {
    
	    if (obj_mario.x > (xmax-xmin)/2+xmin) {
            
	        xspeed += 0.0324;
	        if (xspeed > 2)
	            xspeed = 2;
	    }
	    else if (obj_mario.x < (xmax-xmin)/2+xmin) {
            
	        xspeed += -0.0324;
	        if (xspeed < -2)
	            xspeed = -2;            
	    }
	}
}

//Vertical speed
yspeed += (y > ystart) ? -0.05 : 0.05;

//Follow the player
xscale = ((!instance_exists(obj_mario)) || (obj_mario.x < x)) ? -1 : 1;
    
//Snap outside the level when outside the view
if (x < camera_get_view_x(view_camera[0]) -32)
    x = -32;
if (x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) + 32)
    x = room_width + 32;
