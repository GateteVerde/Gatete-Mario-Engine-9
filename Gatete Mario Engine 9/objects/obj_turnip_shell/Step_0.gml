/// @description SMB2 Holdable Item logic

//Previous horizontal speed
prevxspeed = xspeed;

//If the object is being held.
if (held) {

    //If the control key is being pressed and the vegetable can be thrown.
    if (input_check_pressed(input.action_1)) {
    
        //If the player does exist.
        if (instance_exists(obj_mario)) {
        
            //Play 'Throw' sound
            audio_play_sound(snd_throw, 0, false);
            
			//With Mario
            with (obj_mario) {
				
				holding = 0;
				kicking = 1;
				alarm[5] = 10;
			}
            
            //Check if 'Up' is pressed and throw the object upwards if so.
            if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {

                //Set the vertical speed
                yspeed = (place_meeting(x, y, obj_swim)) ? -3 : -6;
                yadd = 0.2;
                
                //Set horizontal speed
		        xspeed = (swimming) ? 1.25 * sign(obj_mario.xscale) : 2.5 * sign(obj_mario.xscale);
            }
            
            //Otherwise, if it's not.
            else {
            
                //Set the vertical speed
                yspeed = 0.1;
                yadd = 0.2;
				
				//Set the horizontal speed
				xspeed = (swimming) ? 1.25 * sign(obj_mario.xscale) : 2.5 * sign(obj_mario.xscale);
            }
            
            //Stop holding.
            held = false;
			
			//Delay player hurt
			alarm[1] = 16;
        }
    }
}

//Otherwise, if the object is not longer being held
else {
	
	//Handle psuedo movement
	if (freeze == false) {
	
		x += xspeed;
		y += yspeed;
		yspeed += yadd;
	}
	
	//If collisions are allowed
	if (allow_collision == true) {
		
		//NPC Wall & Ceiling
		ai_npc_wall(1);
		ai_npc_ceiling(1);
    
		//If the direction changes...
		if (sign(xspeed) != sign(prevxspeed)) {
			
			//If the shell is outside
			if (outside_view() == false) {
			
				audio_play_sound(snd_bump, 0, false);
			}
			
			//Create shell thump
			with (instance_create_depth(x+(5*sign(prevxspeed)), y, -6, obj_shellthump)) 
				bump = true;
		}

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
			
				//Stop vertical movement
				yspeed = 0;
				yadd = 0;
			}
		}
		
		//Otherwise, apply gravity
		else
			yadd = (swimming) ? 0.03125 : 0.25;
			
	}
	
	//Round position
	if (yspeed == 0)
		y = round(y);
	
	//Vertical speed capacity
	yspeed = min(4 - (swimming * 2), yspeed);
	
	//Check for a water object
    var water = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_swim, 0, 0);
    
    //If the object is not underwater and makes contact with water
    if ((water) && (!swimming)) {
    
        //Make the object go underwater
        swimming = true;
        
        //Slowdown
        xspeed = xspeed/2;
        
        //Stop vertical movement
        yadd = 0;
        if (yspeed > 0)
            yspeed = 0;
    }
    
    //Otherwise, if the object is underwater and it's not underwater, end swimming.
    else if ((!water) && (swimming)) {
    
        swimming = false;
        xspeed = xspeed*2;
    }
}

//Manage animation
if (!held) 
&& (freeze == false)
	image_speed = 1;