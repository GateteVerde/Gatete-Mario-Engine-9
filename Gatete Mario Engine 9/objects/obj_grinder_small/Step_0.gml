/// @description Small Grinder logic

//Check for a track
var track = collision_rectangle(x+xorig, y+yorig-3, x+xorig, y+yorig+0.9, obj_trackparent, 1, 0);

//Update pseudo variables
xspeed = hspeed;
yspeed = vspeed;
yadd = gravity;

//Stay always behind scenery
depth = 150;

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
            
		    //Check for nodes / limits
		    limit = collision_point(x+xorig, y+yorig, obj_track_limit, 1, 0);
		    node = collision_point(x+xorig, y+yorig, obj_track_modifier, 1, 0);
        
		    //If there's a launch node
		    if (node) {

		        //Set 'Falling' state
		        state = "FALLING";
            
		        //Reset step
		        step = 0;             
            
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
    
	#region LOGIC
	
		#region WALL COLLISION
		
			//Check for a platform
			platform_l = collision_rectangle(bbox_left+hspeed, bbox_top+1, bbox_left, bbox_bottom-4, obj_platformparent, 1, 0);
			platform_r = collision_rectangle(bbox_right, bbox_top+1, bbox_right+hspeed, bbox_bottom-4, obj_platformparent, 1, 0);
	
			//If moving right and there's a wall in position
			if (hspeed > 0)
			&& ((collision_rectangle(bbox_right, bbox_top+1, bbox_right+hspeed, bbox_bottom-4, obj_solid, 1, 0))
			|| ((platform_r) && (platform_r.issolid == true))) {
		
				//Stop horizontal movement or reverse movement
				hspeed = -hspeed;
		
				//Prevent NPC from getting embed on the wall
				while (collision_rectangle(bbox_right, bbox_top+1, bbox_right, bbox_bottom-4, obj_solid, 1, 0))
					x--;
			}
	
			//Otherwise, if moving left
			else if (hspeed < 0)
			&& ((collision_rectangle(bbox_left+hspeed, bbox_top+1, bbox_left, bbox_bottom-4, obj_solid, 1, 0))
			|| ((platform_l) && (platform_l.issolid == true))) {
		
				//Stop horizontal movement or reverse movement
				hspeed = -hspeed;
		
				//Prevent NPC from getting embed on the wall
				while (collision_rectangle(bbox_left, bbox_top+1, bbox_left, bbox_bottom-4, obj_solid, 1, 0))
					x++;
			}		
		#endregion
		
		#region CEILING COLLISION
		
			//Check for a platform above
			var platform_u = collision_rectangle(bbox_left, bbox_top+vspeed, bbox_right, bbox_top+vspeed, obj_platformparent, 1, 0);
	
			//If moving upwards
			if (vspeed < 0) 
			&& ((collision_rectangle(bbox_left, bbox_top+vspeed, bbox_right, bbox_top+vspeed, obj_solid, 1, 0)) 
			|| ((platform_u) && (platform_u.issolid == true))) {
			
				//Prevent the NPC from getting stuck on a ceiling when jumping
				while (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_solid, 1, 0))
				|| ((platform_u) && (platform_u.issolid)) {
						
					y++;
				}
		
				//Stops rising
				vspeed = 0;
			}		
		#endregion
		
		#region FLOOR COLLISION
		
			//Handle position when in-ground
			if (vspeed >= 0) {

				//Check for a conveyor
				var conveyor = collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+2, obj_conveyorparent, 0, 0);
		
				//If there's a conveyor
				if (conveyor)
				&& (conveyor.image_speed != 0) {
		
					//If the conveyor is moving and there's not solid on the way
					if ((conveyor.image_speed < 0) && (!collision_rectangle(bbox_left, bbox_top+4, bbox_left, bbox_bottom-1, obj_solid, 0, 0)))
					|| ((conveyor.image_speed > 0) && (!collision_rectangle(bbox_right, bbox_top+4, bbox_right, bbox_bottom-1, obj_solid, 0, 0)))
						x += conveyor.image_speed;
				}
	
				//Vspeed capacity
				vspeed = min(4, vspeed);
	
				//Check for any nearby ground collision
				var semisolid = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+vspeed, obj_semisolid, 0, 0);
	
				//If there's ground below and Mario is not moving upwards
				if (semisolid)
				&& (bbox_bottom < semisolid.yprevious + 5)
					y = semisolid.bbox_top - floor(sprite_height-(sprite_get_yoffset(sprite_index)));
			}

			#region SLOPES
			
				//Embed Mario/NPCs into the slope if he is walking to ensure correct slope mechanics
				if (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+4, obj_slopeparent, 1, 0))
				&& (!collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom-4, obj_slopeparent, 1, 0)) 
				&& (vspeed == 0) 
					y += 4;

				//Handle slope collisions
				if (collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom, obj_slopeparent, 1, 0))
				&& (!collision_rectangle(bbox_left, bbox_bottom-8, bbox_right, bbox_bottom-8, obj_slopeparent, 1, 0)) {
		
					//If moving down
					if (vspeed > 0) {
			
						//Stop vertical speed
						vspeed = 0;
						gravity = 0;
					}
			
					//Round position variables
					y = round(y);
			
					//Prevent getting embed on a slope
					while (collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom, obj_slopeparent, 1, 0))
						y--;	
				}			
			#endregion

			//Check if there's a semisolid
			if ((collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0)) 
			&& (!collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom-4, obj_semisolid, 0, 0))) 
			|| (collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_slopeparent, 1, 0)) {
	
				//If moving down
				if (vspeed > 0)
					vspeed = 0;
			}
			else if (state != "IN_LINE") //<-- For (whatever Mario's profession is now) sake, do not remove this condition.
				gravity = 0.25;
			
		#endregion
	#endregion
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