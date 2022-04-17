/// @description Rip Van Fish logic

//Manage pseudo movement variables
if (freeze == false) {

	x += xspeed;
	y += yspeed;
	yspeed += yadd;
}

//If the rip van fish is sleeping and no chuck is whistling
if (charge == 0) 
&& (global.whistle == 0) {

    //If Mario does exist
    if (instance_exists(obj_mario)) {
    
        //If Mario is nearby
        if (obj_mario.x > x-32)
        && (obj_mario.y > y-32)
        && (obj_mario.x < x+32)
        && (obj_mario.y < y+32) {
        
            //Set the chasing sprite
            sprite_index = spr_ripvanfish_awaken;
            
            //Start chasing
            charge = 1;
            
            //End chase
            alarm[0] = 600;
        }
    }
}

//Otherwise, chase Mario
else {

    //If Mario does exist
    if (instance_exists(obj_mario)) {
    
        //If Mario is under the effects of the starman, scoot away from it.
        if (instance_exists(obj_invincibility)) {
        
            //Set horizontal speed depending of Mario's position
            if (obj_mario.x < x) {
            
                xspeed += 0.0125;
                if (xspeed > 1.5)
                    xspeed = 1.5;
            }
            
            //Otherwise, if Mario is at the right
            else if (obj_mario.x > x) {
            
                xspeed -= 0.0125;
                if (xspeed < -1.5)
                    xspeed = -1.5;
            }
            
            //Set vertical speed depending of Mario's position
            if (obj_mario.y < y) {
            
                yspeed += 0.0125;
                if (yspeed > 1.5)
                    yspeed = 1.5;
            }
            
            //Otherwise, if Mario is at the right
            else if (obj_mario.y > y) {
            
                yspeed -= 0.0125;
                if (yspeed < -1.5)
                    yspeed = -1.5;
            }
        }
        
        //If Mario is not invulnerable
        else {
        
            //Set horizontal speed depending of Mario's position
            if (obj_mario.x < x) {
            
                xspeed -= 0.0125;
                if (xspeed < -1.5)
                    xspeed = -1.5;
            }
            
            //Otherwise, if Mario is at the right
            else if (obj_mario.x > x) {
            
                xspeed += 0.0125;
                if (xspeed > 1.5)
                    xspeed = 1.5;
            }
            
            //Set vertical speed depending of Mario's position
            if (obj_mario.y < y) {
            
                yspeed -= 0.0125;
                if (yspeed < -1.5)
                    yspeed = -1.5;
            }
            
            //Otherwise, if Mario is at the right
            else if (obj_mario.y > y) {
            
                yspeed += 0.0125;
                if (yspeed > 1.5)
                    yspeed = 1.5;
            }        
        }        
    }
	
	//No gravity
	yadd = 0;
    
    //Start chasing
    charge = 1;
    
    //Set the chasing sprite
    sprite_index = spr_ripvanfish_awaken;
	
	//Make sure rip van fishes can't exit water
    water = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_swim, 0, 0);
    
    //If there's water
    if (water)
    && (y < water.y-4)
        y = water.y-4;
}

//Wall/Ceiling collision
ai_npc_wall(0);
ai_npc_ceiling(0);

//Floor collision
#region FLOOR COLLISION

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
	
		//Set up gravity
		yadd = 0.01;
		
		//Cap vertical speed
		if (yspeed > 1)
			yspeed = 1;
	}
#endregion

//Facing direction
if (charge == 0) {

    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xscale = -1;
    else
        xscale = 1;
}
else {

    if (xspeed > 0)
        xscale = 1;
    else if (xspeed < 0)
        xscale = -1;
}
