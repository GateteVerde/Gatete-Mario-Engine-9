/// @description SMW Cheep Cheep logic

//Set swimming flag
swimming = (collision_rectangle(bbox_left, y-1, bbox_right, y, obj_swim, 1, 0)) ? true : false;

//Ignore this event if frozen
if (freeze == true)
exit;

//Manage pseudo movement variables
x += xspeed;
y += yspeed;

//If not flopping
if (swimming == 1) {

	//If the turning endpoint has not been set
	if (prevswim == 0) {
    
	    yspeed = 0.5;
	    xspeed = 0;
	    prevswim = 1;
	    yy = y;
	}

	//Set the sprite
	sprite_index = spr_cheepcheep;
    
	//Animate
	image_speed = 1;
    
	//Do not apply gravity
	yadd = 0;
    
	//If the cheep cheep is moving to the right.
	if (yspeed > 0) {
        
	    //Change direction
	    if (y > yy+32)
	        yspeed = -yspeed;
            
	    //Otherwise
	    else if ((collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_semisolid, 0, 0))
			    || (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom, obj_slopeparent, 1, 0)))
				    yspeed = -yspeed;
	}
    
	//Otherwise, if the cheep cheep is moving to the left.
	else if (yspeed < 0) {
            
	    //Change direction.
	    if (y < yy-32)
	    || (!collision_line(bbox_left, y-1, bbox_right, y, obj_swim, 0, 0))    
	        yspeed = -yspeed;
	}
    
    //Face towards Mario
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xscale = -1;
    else
        xscale = 1;
}

//Otherwise, if flopping
else if (swimming == 0) {

    //Reset turning endpoint
    prevswim = 0;
	
	#region FLOOR COLLISION
	
		//Set gravity
		yspeed += yadd;
		
		//NPC Wall & Ceiling
		ai_npc_wall(turn_toward);
		ai_npc_ceiling(turn_toward_ceiling);

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
	
				//If this object cannot bounce
				if (bounces == -1) {
			
					yadd = 0;
				    yspeed = 0;
				}
		
				//Otherwise, if it can bounce
				else if (bounces != -1) {

					bounces--;
					if (bounces == 0) {
			
						yadd = 0;
						yspeed = 0;
					}
					else {
				
						yspeed = -yspeed/2;
						y--;
					}
				}
			}
		}

		//Otherwise
		else {
	
			//Set up gravity
			yadd = (swimming) ? 0.03125 : 0.25;
	
			//If the item can bounce, reset amount of bounces
			if (bounces > -1) {
		
				if (bounces == 0)
				&& (bounces_max > 0)
					bounces = bounces_max;
			}
		}		
	#endregion

    //Set the flopping sprite
    sprite_index = spr_cheepcheep_flop;
    
    //Do not animate
    image_speed = 0;
    
    //If no gravity
    if (yadd == 0) {
    
        //Change frame
        image_index = !image_index;
    
        //Choose flop and therefore set the horizontal speed
        flopdir = choose(1, -1);
        xspeed = 1*sign(flopdir);
        
        //Set the vertical speed
        yspeed = -2;
    }
    
    //Set facing direction
    xscale = flopdir;    
}
