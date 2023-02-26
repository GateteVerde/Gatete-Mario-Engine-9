/// @description Paragoomba logic

//If the goomba is ascending.
if (flying = 1) {

    //Set the vertical speed.
    yspeed = -2;
    yadd = 0;
    
    //Stop when nearby the top boundary.
    if (y < camera_get_view_y(view_camera[0]) + 48) {
    
        //Follow the player
        flying = 2;
        
        //Set the vertical speed
        yspeed = 0.25;
        
        //Do stuff
        alarm[1] = 24;
        alarm[2] = 48;
        
        //End flight
        alarm[3] = 240;
    }
}

//Otherwise, if the goomba ascended enough.
else if (flying == 2) {

    //If Mario does exist, follow him.
    if (instance_exists(obj_mario)) {
    
        if (obj_mario.x < x) {
        
            xspeed -= 0.05;
            if (xspeed < -2)
                xspeed = -2;
        }
        else if (obj_mario.x > x) {
        
            xspeed += 0.05;
            if (xspeed > 2)
                xspeed = 2;
        }
    }
    
    //Otherwise, follow the level manager.
    else {
    
        if (obj_levelcontrol.x < x) {
        
            xspeed -= 0.05;
            if (xspeed < -2)
                xspeed = -2;
        }
        else if (obj_levelcontrol.x > x) {
        
            xspeed += 0.05;
            if (xspeed > 2)
                xspeed = 2;
        }            
    }    
}

//If not flying
if (flying == 0)
|| (flying == 3) {
	
	//Perform physics parent step event
	event_perform_object(obj_physicsparent, ev_step, ev_step_normal);
	
	//Fly again after a while
	if ((yadd == 0) && (flying == 3)) {
    
	    flying = 0;
	    alarm[0] = 120;
	}
}
else {

	//Manage pseudo movement variables
	if (freeze == false) {
	
		x += xspeed;
		y += yspeed;
		yspeed += yadd;
	}
}

//Animate the wings
if ((flying == 1) || (flying == 2))
    anim += 0.3;
else {
	
	if (alarm[0] < 60)
		anim = 1;
	else
		anim = 0;
}