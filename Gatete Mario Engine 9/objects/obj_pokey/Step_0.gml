/// @description Pokey logic

//If there's no memory of a enemy below.
if (mebelow == noone) {

    //If a enemy is below, remember it.
    if (position_meeting(x, bbox_bottom+8, obj_pokey)) {
    
        //Ride above this pokey
        mebelow = collision_point(x, bbox_bottom+8, obj_pokey, 0, 0);
        
        //Stop moving
        yspeed = 0;
        yadd = 0;
        
        //Manage offset values
        alarm[0] = 10;
    }
    
    //Otherwise, execute default event and deny offset functions.
    else {
    
        #region LOGIC
		
			//Handle pseudo variables
			if (freeze == false) {
			
				x += xspeed;
				y += yspeed;
				yspeed += yadd;
			}
			
			#region WALL COLLISION

				if ((xspeed < 0) && (collision_rectangle(bbox_left-1, bbox_bottom-(a*15), bbox_left, bbox_bottom-4, obj_solid, 1, 0)))
				|| ((xspeed > 0) && (collision_rectangle(bbox_right, bbox_bottom-(a*15), bbox_right+1, bbox_bottom-4, obj_solid, 1, 0))) {
    
				    //Reverse horizontal speed
				    xspeed = -xspeed;
        
				    //Prevent getting embed on walls
				    while (collision_rectangle(bbox_left, bbox_bottom-(a*15), bbox_left, bbox_bottom-4, obj_solid, 1, 0))
				        x++;
				    while (collision_rectangle(bbox_left, bbox_top-(a*15), bbox_right, bbox_bottom-4, obj_solid, 1, 0))
				        x--;
				}
			#endregion
			
			#region CEILING COLLISION
			
				//Check for a platform above
				var platform_u = collision_rectangle(bbox_left, bbox_top+yspeed, bbox_right, bbox_top+yspeed, obj_platformparent, 1, 0);
	
				//If moving upwards
				if (yspeed < 0) 
				&& ((collision_rectangle(bbox_left, bbox_top-(a*15)+yspeed, bbox_right, bbox_top-(a*15)+yspeed, obj_solid, 1, 0)) 
				|| ((platform_u) && (platform_u.issolid == true))) {
				
					//Prevent the NPC from getting stuck on a ceiling when jumping
					while (collision_rectangle(bbox_left, bbox_top-(a*15), bbox_right, bbox_top-(a*15), obj_solid, 1, 0))
					|| ((platform_u) && (platform_u.issolid)) {
						
						y++;
					}
		
					//Stops rising
					yspeed = -yspeed;
				}			
			#endregion
			
			//Turn at enemies script
			event_user(2);
			
			//Handle position when in-ground
			if (yspeed >= 0) {

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
				yspeed = min(4 - (swimming * 2), yspeed);
	
				//Check for any nearby ground collision
				var semisolid = collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+yspeed, obj_semisolid, 0, 0);
	
				//If there's ground below and Mario is not moving upwards
				if (semisolid)
				&& (bbox_bottom < semisolid.yprevious + 5)
					y = semisolid.bbox_top - floor(sprite_height-(sprite_get_yoffset(sprite_index)));
			}

			//Slope Collision
			slope_collision();

			//Check if there's a semisolid
			if ((collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0)) 
			&& (!collision_rectangle(bbox_left, bbox_bottom-4, bbox_right, bbox_bottom-4, obj_semisolid, 0, 0)))
			|| (collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_slopeparent, 1, 0)) {
	
				//If moving down
				if (yspeed > 0) {
			
					yadd = 0;
					yspeed = 0;
				}
			}

			//Otherwise
			else {
				
				yadd = (swimming) ? 0.03125 : 0.25;
			}

	
			//Check for a nearby swimming surface
			var water = collision_rectangle(bbox_left, y-1, bbox_right, y, obj_swim, 1, 0);
    
			//If the NPC is not swimming and makes contact with a water surface
			if ((noswim == false) && (!swimming) && (water)) {
        
				//Make the NPC swim.
				swimming = true;
	
				//Stop most horizontal movement
				xspeed = xspeed/2;
                
				//Stop vertical movement
				if (yspeed > 0)
				    yspeed = 0;
			}

			//Otherwise, if there's no contact with water
			else if ((swimming) && (!water)) {

				//Make the NPC not swim
				swimming = false;
	
				//Double horizontal speed
				xspeed = xspeed*2;
			}			
		#endregion
            
        //Reset offset values
        offset = 0;
        offsetnext = 0;
        
        //Deny offset values
        alarm[0] = -1;
    }
}

//If there's memory of a enemy below.
else {
	
	//Keep it activated
	instance_activate_object(mebelow);
    
    //If the enemy exits, snap it.
    if (instance_exists(mebelow)) {
    
        //Hereby horizontal scale
        xscale = mebelow.xscale;
        
        //Snap above it
        x = mebelow.x;
        y = mebelow.y-16;
    }
    
    //Otherwise, lose memory of it and move towards the player.
    else {
    
        //Lose memory of it.
        mebelow = noone;
        
        //Walk towards the player.
        if (xspeed != 0)
            exit;
        else {
        
            if (!instance_exists(obj_mario)) 
            || (obj_mario.x < x)
                xspeed = -0.2;
            else
                xspeed = 0.2;
        }
    }
}

//If there's a pokey above, use body frame
if (position_meeting(x, y-8, obj_pokey))
    image_index = 1;

//Otherwise, use head frame
else
    image_index = 0;
