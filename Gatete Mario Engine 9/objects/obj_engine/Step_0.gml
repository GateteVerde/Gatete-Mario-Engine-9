/// @description Platform and Track logic

#region TRACK LOGIC

	//Check for a track
	var track = collision_rectangle(x+xorig, y+yorig-3, x+xorig, y+yorig+0.9, obj_trackparent, 1, 0);

	//If the platform is on line
	if (state = "IN_LINE") {
		
		//Do not move if Mario is dead or transforming
		if (!instance_exists(obj_mario_dead))
		&& (!instance_exists(obj_mario_transform)) {

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
            
		        //Check for nodes / limits
		        limit = collision_point(x+xorig, y+yorig, obj_track_limit, 1, 0);
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
		            if (direction == 90) {
            
		                vspeed = -spd*3;
		                if (node.hsp == true) {
                
		                    if (x > xprevious)
		                        hspeed = spd;
		                    else if (x < xprevious)
		                        hspeed = -spd;
		                }      
		            }
            
		            //If moving to the right
		            else if (direction == 0) {
            
		                //If this is a jump node
		                if (node.jump == true) {
                
		                    vspeed = -spd*2.5;
		                    hspeed = spd*2;
		                }
		                else
		                    hspeed = spd;         
		            }
            
		            //If moving to the left
		            else if (direction == 180) {
            
		                //If this is a jump node
		                if (node.jump == true) {
                
		                    vspeed = -spd*2.5;
		                    hspeed = -spd*2;
		                }
		                else
		                    hspeed = -spd;              
		            }
		            else
		                speed = spd;
		        }
        
		        //If there's a limit, reverse direction
		        if (limit) then direct = -180;
        
		        //Update alarm 0
		        alarm[0] = 8;
        
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
	else if (ready == 1) && (state == "FALLING") {
    
	    //If there's a track in position
	    if (track) 
	    && (vspeed > 0) {
    
	        //Set "In_Line" state
	        state = "IN_LINE";
        
	        //Set direction and snap
	        if (hspeed == 0) {
        
	            direct = 270;
	            move_snap(1, 2);
	        }
	        else {

	            //If the track is a circle one
	            //"pls notice me gatete" -mack
	            if ((track.object_index == obj_track_circle)
	            || (track.object_index == obj_track_circle_2x)) {
             
	                direct = 270;
	                move_snap(1, 2);   
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
	                move_snap(1, 2);
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
	    if (vspeed > 3)
	        vspeed = 3;
	}

	//If the platform is outside the view
	if (x < camera_get_view_x(view_camera[0])-128)
	|| (y < camera_get_view_y(view_camera[0])-(height * 16) - 128)
	|| (x > camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]) + 128)
	|| (y > camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]) + 128) {

	    if (xstart < camera_get_view_x(view_camera[0])-128)
	    || (ystart < camera_get_view_y(view_camera[0])-(height * 16) - 128)
	    || (xstart > camera_get_view_x(view_camera[0])+camera_get_view_width(view_camera[0]) + 128)
	    || (ystart > camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0]) + 128) {
		
			//Reset state
			state = "IDLE";
		
			//Go to start position
			x = xstart;
			y = ystart;
		
			//Stop movement
			hspeed = 0;
			vspeed = 0;
			gravity = 0;
		
			//Move it
			alarm[10] = 2;
			
			//If the gizmo is the seesaw
			if (gizmo == 4) {
			
				with (part) {
					
					image_angle = 0;
					angle = 0;
					angle_speed = 0;
				}
			}
	    }        
	}
#endregion

//Manage position of the gizmo
if (part != noone) {

	//If the gizmo is a rope
	if (gizmo == 0) {
	
		part.x = x;
		part.y = y+14;
	}
	
	//Otherwise, if the gizmo is a pole
	else if (gizmo == 1) {
	
		part.x = x;
		part.y = y+14;	
	}
	
	//Otherwise, if the gizmo is a sawblade
	else if (gizmo == 2) {
	
		part.x = x;
		if (inverted == 0)
			part.y = y-28;
		else
			part.y = y+14;
	}
	
	//Otherwise, if the gizmo is a mushroom jelly
	else if (gizmo == 3) {
	
		part.x = x-16;
		part.y = y-4;
	}
	
	//Otherwise, if the gizmo is a seesaw platform
	else if (gizmo == 4) {
	
		part.x = x+8;
		part.y = y+8;
	}
}