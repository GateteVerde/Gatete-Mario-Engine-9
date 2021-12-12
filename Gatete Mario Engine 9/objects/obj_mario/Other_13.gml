/// @description Mario's walljump behaviour script

//Exit this event if you have the mega or balloon powerup.
if (global.powerup == cs_mega) 
|| (instance_exists(obj_mario_balloon)) {

	wallkick = 0;
	wallready = 0;
	exit;
}

//Check for a wall at the right
wall_r = collision_rectangle(bbox_right+1, bbox_top+4, bbox_right+4, bbox_bottom-1, obj_solid, 1, 0);
wall_rb = collision_rectangle(bbox_right+1, bbox_top+4, bbox_right+4, bbox_bottom-1, obj_platformparent, 1, 0);

//Check for a wall to the left
wall_l = collision_rectangle(bbox_left-4, bbox_top+4, bbox_left-1, bbox_bottom-1, obj_solid, 1, 0);
wall_lb = collision_rectangle(bbox_left-4, bbox_top+4, bbox_left-1, bbox_bottom-1, obj_platformparent, 1, 0);

//If moving down, and not crouched down or flying
if (yspeed > 0) 
&& (!crouch) 
&& (!flying)
&& (holding == 0)
&& (jumpstyle != 2)
&& (global.pwing = 0)
&& (global.mount = 0)
&& (!instance_exists(obj_spinner)) {
        
    //If the 'Right' key is pressed and the player is facing right.
    if (((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) && (xscale == 1)) {
        
        //If the player hugs a wall at the right
        if ((wall_r) || ((wall_rb) && (wall_rb.issolid = true))) {
			
			//Stop squirrel propel
			if (squirrelpropel == 1)
			&& (global.powerup == cs_squirrel) {
			
				squirreltime = 0;
				squirrelpropel = 0;
			}
            
            //Enable wallkick
            wallkick = 1;
			wallready = 1;
			
			//Stop spinning
			jumpstyle = 0;
			
			//Stop somersault
			angle = 0;
			somersault = 0;
            
            //Enable gravity if disabled
            enable_gravity = true;
        }            
        else
            wallkick = 0;
    }
    
    //Otherwise, if the 'Left' key is pressed and the player is facing left.
    else if (((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) && (xscale == -1)) {
    
        //If the player hugs a wall at the left
        if ((wall_l) || ((wall_lb) && (wall_lb.issolid = true))) {
			
			//Stop squirrel propel
			if (squirrelpropel == 1)
			&& (global.powerup == cs_squirrel) {
			
				squirreltime = 0;
				squirrelpropel = 0;
			}
            
            //Enable wallkick
            wallkick = 1;
			wallready = 1;
			
			//Stop spinning
			jumpstyle = 0;
			
			//Stop somersault
			angle = 0;
			somersault = 0;
            
            //Enable gravity if disabled
            enable_gravity = true;
        }
        else
            wallkick = 0;
    }
    else
        wallkick = 0;
}

//Handle wall kick
if (wallkick == 1) {

    //If the player does have the cat powerup.
    if ((global.powerup == cs_bell) && ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5))) {
    
        //If the player can climb
        if (catclimbing < (global.cattime * 60)) {
                
            //Increase cat climb
            catclimbing++;    
            
            //Move up
            yspeed -= 0.5;
            
            //No grav
            yadd = 0;
            
            //Prevent the player from climbing too fast.
            if (yspeed < -1.5)
                yspeed = -1.5;  
        }
        else if (catclimbing == (global.cattime * 60)) {
            
            //Set the gravity
            yadd = 0.03;
            
            //Prevent the player from falling too fast.
            if (yspeed > 1.5)
                yspeed = 1.5;
        }
    }
    
    //Otherwise, if the player does not have the cat powerup
    else {
		
		//If the player has the squirrel suit
		if (global.powerup == cs_squirrel) {
			
			//If Mario can hang on the wall
			if (squirreltime < 120) {
				
				squirreltime++;
				yadd = 0;
				if (yspeed > 0)
					yspeed = 0;
			}
			
			//Otherwise
			else {
				
				yadd = 0.3625;
				if (yspeed > 1)
					yspeed = 1;
			}
		}
		
		//Otherwise
		else {
    
	        //Set the gravity
	        yadd = 0.3625;
    
	        //Prevent the player from falling too fast
	        if (yspeed > 1.5)
	            yspeed = 1.5;
		}
    }

    //If the 'Jump' key is being pressed.
    if (input_check_pressed(input.action_0)) {
    
        //Set the vertical speed
		switch (global.powerup) {	
			
			case (cs_tiny): 
				yspeed = -2.7375; break;
			
			//Rest of powerups
			default: 
				yspeed = -3.3628; break;
		}
        
        //Perform spin jump if 'Up' is pressed and Mario does not have the Propeller or Cat powerups
        if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5))
		&& (global.powerup != cs_tiny)
        && (global.powerup != cs_propeller) 
        && (global.powerup != cs_bell) {
        
            //Play 'Spin' sound
            audio_play_sound(snd_spin, 0, false);
        
            //Set spin jump mode
            jumpstyle = 1;
			
			//Execute 'throw_projectile_spin' function
			timer(throw_projectile_spin, 15);
        }
        
        //Allow variable jump
        jumping = 1;
        
        //Allow wallkick
		timer(wallkick_allow, 20, false);
    
        //If the 'Right' key is pressed and the player is facing right.
        if (xscale > 0) {
        
            //Set the horizontal speed
            xspeed = -2;
            
            //Move 2 pixels to the left
            x -= 2;
            
            //End walljump
            wallkick = 2;
            
            //Facing direction
            xscale = -1;
			
			//Reset squirrel time
			squirreltime = 0;
            
            //Play 'Stomp' sound
            audio_play_sound(snd_stomp, 0, false);
            
            //Create thump effect
            with (instance_create_depth(bbox_right, y+8, depth+1, obj_smoke))
                sprite_index = spr_spinthump;

        }
        
        //Otherwise, if the 'Left' key is pressed and the player is facing left.
        else if (xscale < 0) {
        
            //Set the horizontal speed.
            xspeed = 2;
            
            //Move 2 pixels to the right
            x += 2;
                        
            //End walljump
            wallkick = 2;            
            
            //Facing direction
            xscale = 1;
            
            //Play 'Stomp' sound
            audio_play_sound(snd_stomp, 0, false);
            
            // Create thump effect
            with (instance_create_depth(bbox_left, y+8, depth+1, obj_smoke))
                sprite_index = spr_spinthump;
				
        }
    }
	
    //End manually wall kick when not in-air or swimming.
    if ((state < 2) || (swimming))
        wallkick = 0;
        
    //End manually wall kick when not in contact with a wall.
	if (wallkick != 2) {
		
	    if ((xscale < 0) && ((!wall_l) && (!wall_lb)))
	    || ((xscale > 0) && ((!wall_r) && (!wall_rb))) {
		
	        wallkick = 0;
			wallready = 0;
		}
	}
}