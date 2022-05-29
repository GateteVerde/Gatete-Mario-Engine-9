/// @description Mario's climb behaviour

//Disable gravity
yadd = 0;

//Reset sliding
if (sliding > 0) {

    //Stop sliding
    sliding = 0;
}

//Reset bunny and carrot fly
beefly = 0;
floatnow = 0;
if (isfloating) {

    isfloating = 0;
    if (audio_is_playing(snd_spin))
        audio_stop_sound(snd_spin);
}

//Reset spin jump
jumpstyle = 0;

//Reset ground pound
groundpound = 0;

//Reset player local variables
event_user(15);

//Cap horizontal speed
if (xspeed > 1)
xspeed = 1;
if (xspeed < -1)
xspeed = -1;

//Cap vertical speed
if (yspeed > 1)
yspeed = 1;
if (yspeed < -1)
yspeed = -1;

//Handle climbing
if (enable_control == true) { //If the player controls are enabled.
	
	//If the climbing style is SMB3/SMW
	if (climbstyle == 0) {

	    //If the 'Right' key is held and the 'Left' key is not held.
	    if (((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) && (!input_check(input.left))) {
    
	        //Set the horizontal speed.
	        xspeed += 0.15;
        
	        //Set the facing direction.
	        xscale = 1;
	    }
    
	    //Otherwise, if the 'Left' key is held and the 'Right' key not.
	    else if (((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) && (!input_check(input.right))) {
    
	        //Set the horizontal speed.
	        xspeed += -0.15;
        
	        //Set the facing direction.
	        xscale = -1;
	    }
    
	    //Otherwise, if neither of the 'Left' or 'Right' keys are being held.
	    else    
			xspeed = 0;
    
	    //If the 'Up' key is held and the 'Down' key is not held.
	    if (((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) && (!input_check(input.down))) {
    
	        //Check if there's not a solid in the way.
	        if (!collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_top-1, obj_solid, 1, 0)) {
        
	            //If there's not a climbable surface above the player.
	            if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_climb, 0, 0)) 
	                yspeed = 0;
            
	            else { //Otherwise, allow him to climb.
            
	                //Set the vertical speed.
	                yspeed += -0.15;
                
	                //Check for a climbable surface
					cc = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_climb, 1, 0);
				
					//If there's a climbable surface
					if (cc)
					&& (cc.image_xscale == 1) {
                
						//If moving up
	                    if (yspeed < 0) {
                    
	                        noise++;
	                        if (noise > 7) {
                        
	                            //Reset variable
	                            noise = 0;
                            
	                            //Play 'Climb' sound
	                            audio_play_sound(snd_climb, 0, false);
	                        }
	                    }
	                    else
	                        noise = 0;
	                }
	                else
	                    noisy = 0;
	            }
	        }
	    }
    
	    //If the 'Down' key is held and the 'Up' key not.
	    else if (((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) && (!input_check(input.up))) {
    
	        //Set the vertical speed.
	        yspeed += 0.15;
        
	        //Check for a nearby floor and stop climbing if there's one.
	        if (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0))
			|| (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_enemy_top, 0, 0))
	            state = playerstate.jump;
	    }
    
	    //Otherwise, if neither of the 'Up' or 'Down' keys are being held.
	    else            
	        yspeed = 0;
    
	    //Make the player able to jump.
	    if (input_check_pressed(input.action_0)) { //If the 'Shift' key is pressed and the player is not jumping.
        
	        //Set the jumping state.
	        state = playerstate.jump;      
          
	        //Make the player able to vary the jump.
	        jumping = 1;
		
			//If the player is not doing a spin-jump
			if (global.powerup != cs_tiny) {
			
				yspeed = -3.4675;
				audio_play_sound(snd_jump, 0, false);
			}
			else {
			
				yspeed = -2.7375;
				audio_play_sound(snd_jump_tiny, 0, false);
			}
	    }
		
		//Make the player able to punch fences
		if ((input_check_pressed(input.action_1)) && (netsmack < 4)) {
		
			netsmack = 4;
			if (!audio_is_playing(snd_bump))
				audio_play_sound(snd_bump, 0, false);
		}
		
		//Check if there's a not climbable surface overlapping the player.
		if (instance_exists(obj_mario_balloon))
		|| (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_climb, 0, 0))
		    state = playerstate.jump;
	}
	
	//Otherwise, if the climb style is the SMB1 one
	else if (climbstyle == 1) {

		//If the player can turn it's direction
		if (canhang == 2) {

		    //If 'Right' is pressed
		    if ((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) {
    
		        //Set the facing direction
		        xscale = -1;
        
		        //Release the vine if the key has been held enough
		        canturn++;
		        if (canturn > 19) {
        
		            //Force set jump state
		            state = playerstate.jump;
            
		            //Disallow climbing
		            timer(allow_climb, 12);
		            canhang = 3;
            
		            //Set movement
		            xspeed = -0.96*xscale;
            
		            //Set the facing direction
		            xscale = 1*sign(xspeed);
		        }    
		    }
    
		    //Otherwise, if 'Left' is pressed
		    else if ((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) {
    
		        //Set the facing direction
		        xscale = 1;
        
		        //Release the vine if the key has been held enough
		        canturn++;
		        if (canturn > 19) {
        
		            //Force set jump state
		            state = playerstate.jump;
            
		            //Allow climbing
		            timer(allow_climb, 12);
		            canhang = 3;
            
		            //Set movement
		            xspeed = -0.96*xscale;
            
		            //Set the facing direction
		            xscale = 1*sign(xspeed);
		        }
		    }
    
		    //Otherwise, reset turning variable
		    else
		        canturn = 0;
		}
    
		//Move up if 'Up' is held.
		if (((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) && (!input_check(input.down))) {

		    if (!position_meeting(x, y-1, obj_climb_side))
		        yspeed = 0;
		    else
		        yspeed = -1;
		}

		//Move down if 'Down' is held.
		else if (((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) && (!input_check(input.up))) {

		    //Move downwards
		    yspeed = 1;

		    //Check for ground
		    while (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+vspeed, obj_semisolid, 0, 0))
		        y--;
		}

		//Otherwise, stop the player
		else
		    yspeed = 0;

		//Make the player jump.
		if (input_check_pressed(input.action_0)) {

		    //Play 'Jump' sound
		    audio_play_sound(snd_jump, 0, false);   
    
		    //Force set 'Jump' state
		    state = playerstate.jump;
    
		    //Disallow climbing
		    timer(allow_climb, 12);
		    canhang = 3;
    
		    //End variable jumping
		    jumping = 1;
        
		    //Set movement
			xspeed = -2*xscale;
			if (global.powerup != cs_tiny)
				yspeed = -3.4675;
			else {
			
				audio_stop_sound(snd_jump);
				audio_play_sound(snd_jump_tiny, 0, false);
				yspeed = -2.7375
			}
		    
		    //Move Mario 8 pixels
		    x -= 8*sign(xscale);     
    
		    //Set the facing direction
		    xscale = 1*sign(xspeed);
		}

		//Makes the player move down when there's not a climbable surface above.
		if (instance_exists(obj_mario_balloon))
		|| (!collision_rectangle(bbox_left, y, bbox_right, y+16, obj_climb_side, 0, 0)) {

		    if (yspeed < 0)
		        yspeed = 0
		    else {
    
		        //Force set 'Jump' state
		        state = playerstate.jump;
                    
		        //Disallow climbing
		        timer(allow_climb, 12);
		        canhang = 3;
        
		        //Move Mario 8 pixels
		        x -= 8*sign(xscale);
		    }
		}
	}
}