/// @description Make Mario run in the wall

//Should not have these powerups
if (global.powerup == cs_tiny)
|| (global.powerup == cs_frog)
|| (global.powerup == cs_bell)
|| (global.powerup == cs_mega)
exit;

//If Mario is riding a Yoshi
if (global.mount == 1) {
	
	//Play 'Trampoline' sound
	audio_play_sound(snd_trampoline, 0, false);

	//Make Mario jump
	with (obj_mario) {
			
		event_user(1);
		state = playerstate.jump;
	}
}

//Otherwise, if Mario is not riding a Yoshi
else if (global.mount == 0) {
	
    //Must run at the 'running speed' to get on the wall triangle!
    if (abs(other.xspeed) > 2.5) {
		
		//If the player meets these conditions
        if (other.state < playerstate.jump)
        && (other.crouch == 0)
        && (other.holding == 0)
		&& (other.swimming == false)
        && (!instance_exists(obj_mario_wallrunner)) {
			
            //If the player is facing right...
            if (other.xscale > 0)
            && (collision_rectangle(bbox_right, bbox_top, bbox_right+4, bbox_bottom, obj_solid, 0, 0)) {
                
				//Create wall runner...
				wall = instance_create_depth(x+1, y-8, -5, obj_mario_wallrunner) {
                    
					//...with these conditions
					wall.xscale = other.xscale;
                    wall.direction = 45;
                    wall.desired_offset_x = 1;
                    wall.desired_dir = 90;
                    wall.desired_speed = abs(other.xspeed);            
                }
            }
			
            //If the player is facing left...
            if (other.xscale < 0) 
            && (collision_rectangle(x+8, bbox_bottom, x+9, bbox_bottom+4, obj_semisolid, 0, 0))
            && (!collision_rectangle(x-8, bbox_bottom, x-7, bbox_bottom+4, obj_semisolid, 0, 0)) {
				
				//Create wallrunner
                wall = instance_create_depth(x+1, y-8, -5, obj_mario_wallrunner) {
					
					//...with these conditions
                    wall.xscale = other.xscale;
                    wall.direction = 225;
                    wall.desired_dir = 270;
                    wall.desired_offset_x = -14;
                    wall.desired_offset_y = 7;
                    wall.desired_speed = abs(other.xspeed);
                }
            }            
        }
    }
}