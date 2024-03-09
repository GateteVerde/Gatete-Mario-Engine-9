/// @description Track Fuzzy logic

//Check for a track
var track = collision_rectangle(x+xorig, y+yorig-3, x+xorig, y+yorig+0.9, obj_trackparent, 1, 0);

//Update pseudo variables
xspeed = hspeed;
yspeed = vspeed;
yadd = gravity;

//If the grinder is on line
if (state = "IN_LINE") {
	
	//If the sawblade is not frozen
	if (freeze == false) {

		//Update steps
		step += spd;
		while (step >= 1) {
    
		    //Travel through tracks
		    if (collision_point(x+xorig+cos(degtorad(direct)), y+yorig-sin(degtorad(direct)), obj_trackparent, 1, 0)) {
        
		        x += cos(degtorad(direct));
		        y += -sin(degtorad(direct));
		    }
		    else if (collision_point(x+xorig+cos(degtorad(direct))-sin(degtorad(direct)), y+yorig-sin(degtorad(direct))-cos(degtorad(direct)), obj_trackparent, 1, 0)) {
        
		        x += cos(degtorad(direct))-sin(degtorad(direct));
		        y += -sin(degtorad(direct))-cos(degtorad(direct));
		    }
		    else if (collision_point(x+xorig+cos(degtorad(direct))+sin(degtorad(direct)), y+yorig-sin(degtorad(direct))+cos(degtorad(direct)), obj_trackparent, 1, 0)) {
        
		        x += cos(degtorad(direct))+sin(degtorad(direct));
		        y += -sin(degtorad(direct))+cos(degtorad(direct));
		    }
		    else if (collision_point(x+xorig-sin(degtorad(direct)), y+yorig-cos(degtorad(direct)), obj_trackparent, 1, 0)) {
        
		        x += -sin(degtorad(direct));
		        y += -cos(degtorad(direct));
		        direct += 90;
		    }
		    else if (collision_point(x+xorig+sin(degtorad(direct)), y+yorig+cos(degtorad(direct)), obj_trackparent, 1, 0)) {
        
		        x += sin(degtorad(direct));
		        y += cos(degtorad(direct));
		        direct -= 90;
		    }
		    else {
        
		        direct += 180;
		    }
            
	        //Check for nodes
	        node = collision_point(x+xorig, y+yorig, obj_track_modifier, 1, 0);
        
	        //If there's a launch node
	        if (node) {

	            //Set 'Falling' state
	            state = "FALLING";
            
	            //Reset step
	            step = 0;             
            
	            //Apply gravity
	            gravity = 0.1;
            
	            //Set direction
	            direction = direct;
            
	            //If moving up, jump
		        if (y < yprevious) {
            
		            vspeed = (x = xprevious) ? -spd * 3 : -spd * 1.5;
		            if (x > xprevious)
		                hspeed = spd * 1.5;
		            else if (x < xprevious)
		                hspeed = -spd * 1.5;
		        }
            
		        //If moving to the right
		        else if (x > xprevious) {
            
		            //If this is a jump node
		            if (y < yprevious) {
                
		                vspeed = -spd * 1.5;
		                hspeed = spd * 1.5;
		            }
		            else {
						
		                hspeed = spd * 1.5;
						if (y > yprevious)
							vspeed = spd * 1.5;
					}
		        }
            
		        //If moving to the left
		        else if (x < xprevious) {
            
		            //If this is a jump node
		            if (y < yprevious) {
                
		                vspeed = -spd * 1.5;
		                hspeed = -spd * 1.5;
		            }
		            else {
						
		                hspeed = -spd * 1.5;
						if (y > yprevious)
							vspeed = spd * 1.5;
					}
		        }
		        else
		            speed = spd * 1.5;
	        }
        
	        //Update alarm 0
	        alarm[0] = 4;
        
	        //Update step
	        step--;
        
	        //Reset angles
	        if (direct < 0)
	            direct += 360;
	        else if (direct >= 360)
	            direct -= 360;
		}
	}
}

//Otherwise if falling
else if (state == "FALLING") {
    
	//If there's a track in position
	if (track)
	&& (ready = 1)
	&& (vspeed > 0) {
    
	    //Set "In_Line" state
	    state = "IN_LINE";
        
	    //Set direction and snap
	    if (hspeed == 0) {
        
	        direct = 270;
	        move_snap(1, 1.5);
	    }
	    else {

	        //If the track is a circle one
	        //"pls notice me gatete" -mack
	        if ((track.object_index == obj_track_circle)
	        || (track.object_index == obj_track_circle_2x)) {
             
	            direct = 270;
	            move_snap(1, 1.5);   
	        }
        
	        //If the track is a horizontal one
	        else if (track.object_index == obj_track_h) {
            
	            move_snap(1, 8);
	            if (hspeed > 0)
	                direct = 0;            
	            else if (hspeed < 0)
	                direct = 180;
	        }
	        else {
            
	            direct = 270;
	            move_snap(1, 1.5);
	        }             
	    }
                             
	    //Stop vertical movement
	    hspeed = 0;
	    vspeed = 0;
	    gravity = 0;
                
	    //In line
	    ready = 0;
	}
    
	//Cap vertical speed
	vspeed = min(4, vspeed);
	
	//Apply gravity when not in line
	if ((state != "IN_LINE") && (freeze == false)) //<-- For (whatever Mario's profession is now) sake, do not remove this condition.
		gravity = 0.25;
}

//If the platform is outside the view
if (outside_view()) {

	if (xstart < camera_get_view_x(view_camera[0])-32)
	|| (ystart < camera_get_view_y(view_camera[0])-32)
	|| (xstart > camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0])+32)
	|| (ystart > camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+32) {
		
		//Reset state
		state = "IDLE";
		
		//Go to start position
		x = xstart;
		y = ystart;
		
		//Stop movement
		hspeed = 0;
		vspeed = 0;
		gravity = 0;
		
		//Set up direction based on modifier
		alarm[10] = 2;
	}        
}
