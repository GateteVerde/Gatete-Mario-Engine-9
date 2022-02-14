/// @description Mario's main behaviour script

//Check if there's a collision below and if Mario is on the ground
if ((collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0))
|| (collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_slopeparent, 1, 0)))
&& (yadd == 0) {

	//If the player is flying and moving upwards...
	if ((flying) && (yspeed < 0))
	
	//...or the player is floating...
	|| ((isfloating) && (yspeed < 0))
	
	//...or the player is riding yoshi and this one is doing a flutter jump
	|| ((instance_exists(obj_yoshi)) && (obj_yoshi.flutter == 1) && (yspeed < 0))
	
		//Set up the 'Jump' state
		state = playerstate.jump;
		
	//Otherwise
	else {
		
		//If the player is falling or at the ground
		if (yspeed >= 0) {
			
			//Reset jump delay
			statedelay = 0;
		
			//Figure out if the player is standing or walking
			if (xspeed == 0)
				state = playerstate.idle;
			else
				state = playerstate.walk;
		}
		
		//Otherwise, set 'Jump' state
		else if (yspeed < 0)
			state = playerstate.jump;
	}
}

//Otherwise
else {

	//Delay change to 'Jump' state
	if (statedelay > 4)
		state = playerstate.jump;
	else
		statedelay++;
}

//Determine what the speed should be for Mario to fall at
var yspeed_max;

switch (global.powerup) {
	
	case (cs_tiny):
		yspeed_max = 2.5;
		break;

	default:
		yspeed_max = (groundpound = 2) ? 6 : 4;
		break;	
}

// Cap at the determined speed
if (yspeed > yspeed_max)
	yspeed = yspeed_max;
	
//Set up the player's maximum horizontal speed.
if (!flying)
|| (global.powerup == cs_cape) { //If the player is not flying
	
    //Run grace period of 2 frames (fireballs, etc)
	if (input_check_released(input.action_1))			
		run_cooldown = 2;
			
	//Subtract cooldown
	if (run_cooldown > 0)		
		run_cooldown --;

    if (input_check(input.action_1) || (run_cooldown > 0)) { //If the 'Run' key is being held.
        
        //If Mario does have the frog powerup
        if (global.powerup == cs_frog) {
        
            if (holding == 0)
                xspeedmax = 1.3;
            else {
                            
                //If the P-Meter is filled up.
                if (run)
                    xspeedmax = 3.3;
                
                //Otherwise, if the P-Meter is not filled up.
                else    
                    xspeedmax = 2.6;                
            }
        }
		
		//If Mario does have the Tiny powerup
		else if ((global.powerup == cs_tiny) || (global.powerup == cs_mega))
			xspeedmax = 2.6;
        
        //Otherwise, if Mario does not have the frog, tiny or mega powerup
        else {
            
            //If the P-Meter is filled up.
            if (run) 
                xspeedmax = 3.3;
            
            //Otherwise, if the P-Meter is not filled up.
            else    
                xspeedmax = 2.6;
        }
    }               
    
    //Otherwise, do not reduce speed until the player makes contact with the ground.  
    else {
		
		if (global.powerup == cs_tiny)
		|| (global.powerup == cs_mega)
			xspeedmax = 1;
		else
			xspeedmax = 1.3;
	}
}

//Otherwise, if the player is flying.
else {

    //If the player is flying
    if (flyfix == 1) {
    
        xspeedmax = 2;
        if (xspeed > 2)
            xspeed -= 0.06;
        if (xspeed < -2)
            xspeed += 0.06;
    }
    else {
    
        //Set running speed
        if (input_check(input.action_1))
            xspeedmax = 2.6;           
        
        //Otherwise, do not reduce speed until the player makes contact with the ground.  
        else     
            xspeedmax = 1.3;    
    }
}

//If controls are enabled and the player is not stuck in a wall
if (inwall == 0)
&& (enable_control == true) {

	//If the 'Jump' key is pressed
	if (input_check_pressed(input.action_0))
	
	//...and the player can jump
	&& (((jumping == 0) && (state < 2))
	
    //Allow the player to jump off of Yoshi or a shoe while in midair
    || ((input_check(input.up) || (gamepad_axis_value(0, gp_axislv) < -0.5))
    && (crouch == 0)
    && (holding == 4)
    && (global.mount != 0))
    
    //Allow propeller the player to do his special jump
    || ((global.powerup == cs_propeller)
    && ((input_check(input.up) || (gamepad_axis_value(0, gp_axislv) < -0.5)))
    && (jumpstyle == 0) 
    && (crouch == 0) 
    && (holding == 0))
    
    //Allow the player to jump in mid-air while riding a kuribo shoe
    || ((global.mount == 2) 
    && (state == playerstate.jump) 
    && (yspeed > 0)
    && (jumping == 0))) {
    
        //Make the player spin jump
        if (((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5))
        && (crouch == 0)
		&& (global.powerup != cs_tiny)
		&& (global.powerup != cs_mega)
		&& (global.powerup != cs_carrot)
        && ((holding == 0) || (holding == 4))) {
        
            //If a kuribo shoe is being ridden, dismount from it.
            if (global.mount == 2) {
            
                with (obj_kuriboshoe) event_user(0);
                if (state < 2) {
                    
                    //Play 'Spin' sound
                    audio_play_sound(snd_spin, 0, false);
                    
                    //Set horizontal speed
                    xspeed = 1*(xscale*-1);
                
                    //Set spin jump variable
                    jumpstyle = 1;
					
					//Execute 'throw_projectile_spin' function
					timer(throw_projectile_spin, 15);
                }
                else {
                
                    //Do not set spin jump
                    jumpstyle = 0;
                
                    //Play 'Jump' sound
                    audio_play_sound(snd_jump, 0, false);
                }            
            }
            
            //If a Yoshi is being ridden, dismount from it.
            else if (global.mount == 1) {
            
                with (obj_yoshi) event_user(1);
                if (state < 2) {
                    
                    //Play 'Spin' sound
                    audio_play_sound(snd_spin, 0, false);
                    
                    //Set horizontal speed
                    xspeed = 1*(xscale*-1);
                
                    //Set spin jump variable
                    jumpstyle = true;
										
					//Execute 'throw_projectile_spin' function
					timer(throw_projectile_spin, 15);
                }
                else {
                
                    //Do not set spin jump
                    jumpstyle = 0;
                
                    //Play 'Jump' sound
                    audio_play_sound(snd_jump, 0, false);
                }              
            }
            
            else {
									
				//Execute 'throw_projectile_spin' function
				timer(throw_projectile_spin, 15);
            
	            //Set spin jump variable
	            jumpstyle = 1;

	            //Play spin jump sound
				if (global.powerup == cs_propeller)
					audio_play_sound(snd_propeller, 0, false);
				else
					audio_play_sound(snd_spin, 0, false);
            }
        }
    
        //Play the jump sound if he is not spin jumping
        else {
                
            //Do not set spin jump
            jumpstyle = 0;
			
			//Play sound based on powerup
			switch (global.powerup) {
				
				//Mega Mario
				case (cs_mega): audio_play_sound(snd_jump_big, 0, false); break;
				
				//Tiny Mario
				case (cs_tiny): audio_play_sound(snd_jump_tiny, 0, false); break;
				
				//Default
				default: audio_play_sound(snd_jump, 0, false); break;
			}
            
            //If the player is invulnerable
            if (instance_exists(obj_invincibility))
			&& (global.powerup != cs_tiny)
			&& (global.powerup != cs_mega)
			&& (holding == 0)
			&& (crouch == false)
			&& (jumpstyle == false)
			&& (squirrelpropel == false)
                somersault = 1;
        }
    
        //Switch to the jump state
        state = playerstate.jump;
        
        //Enable variable jumping
        jumping = 1;
        
        //Jump high if you have the frog powerup, and you are not riding anything
        if (global.powerup == cs_frog)    
            yspeed = -3.7675;
    
        //Jump depending of the horizontal speed.
        else {
			
			//If Mario is not tiny
			if (global.powerup != cs_tiny) {
				
				// Make Mario fly!
				if ((run) && (global.powerup == cs_cape) && (crouch == false)) {
					
					//Start flying
					flying = true;
					
					//Stop somersault
					somersault = 0;
					
					//Disable the gravity for an elegant lift-off
					disablegrav = 50;
					
					//Set vertical speed
					yspeed = -4;
				}
				
				//If the player is not doing a spin-jump
				else if (jumpstyle == 0) {
					
					if (global.powerup == cs_carrot)
						yspeed = -3.7675+abs(xspeed)/7.5*-1;
					else
						yspeed = -3.4675+abs(xspeed)/7.5*-1;
				}
					
				//If the player is doing a spin-jump
				else {
					
					if (global.powerup != cs_squirrel)
						yspeed = -3.23775+abs(xspeed)/7.5*-1;
					else
						yspeed = -3.7675+abs(xspeed)/7.5*-1;
				}
			}
			else
				yspeed = -2.7375+abs(xspeed)/7.5*-1;
		}
    }
    
    //Check if the player should still be variable jumping
    if (input_check_released(input.action_0))
    && (jumping == 1)
        jumping = 2;
		
	//Toggle Mario's horizontal movement
	event_user(8);
	
	//Handle Horizontal Movement.
    if (((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) && (move) && (wallkick < 1) && (!input_check(input.left))) { //If the player holds the 'Right' key and the 'Left' key is not being held.
        
        //Set the facing direction        
        if ((holding == 2) && (xscale != 1)) {
        
            turning = 1;
            timer(turning_end, 6, false);
        }
        
        //If the player is not overlapping a wall
        if (!inwall)
            xscale = 1;
        
        //Check up the player's horizontal speed
        if (xspeed < xspeedmax) {
                        
            //Make the player move horizontally.
            if (isslip = false) 
            || (global.powerup == cs_penguin) { //If the player is not overlapping a slippery surface.
                
                //If the player's horizontal speed is equal/greater than 0.
                if (xspeed >= 0) {
                
                    //Add 'acc' to xspeed.
                    if (global.powerup != cs_frog)
                        xspeed += 0.06;
                    else {
                    
                        //If Mario is not holding or is not riding a yoshi or a kuribo shoe.
                        if ((holding == 0) && (global.mount == 0))                              
                            xspeed += 0.12;
                        else
                            xspeed += 0.06;
                    }
                }
                else { //Otherwise, if the player's speed is lower than 0.
                
                    //Add 'accskid' to xspeed;
                    xspeed += 0.15;
                }
            }
            else { //Otherwise, if the player is overlapping a slippery surface.
            
                //If the player's horizontal speed is equal/greater than 0.
                if (xspeed >= 0) {
                
                    //Add 'acc' to xspeed.
                    if (global.powerup != cs_frog)
                        xspeed += 0.03;
                    else {
                    
                        //If Mario is not holding or is not riding a yoshi or a kuribo shoe.
                        if ((holding == 0) && (global.mount == 0))                              
                            xspeed += 0.06;
                        else
                            xspeed += 0.03;
                    }
                }
                else { //Otherwise, if the player's speed is lower than 0.
                
                    //Add 'accskid' to xspeed.
                    xspeed += 0.075;
                }                                              
            }
        }
    }
    
    //Otherwise, if the player holds the 'Left' key and the 'Right' key is not being held.
    else if (((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) && (move) && (wallkick == 0) && (!input_check(input.right))) {
                
        //Set the facing direction    
        if ((holding == 2) && (xscale != -1)) {
        
            turning = 1;
            timer(turning_end, 6, false);
        }
        
        //If the player is not overlapping a wall
        if (!inwall)
            xscale = -1;
        
        //Check up the player's horizontal speed.
        if (xspeed > -xspeedmax) {
                
            //Make the player move horizontally.
            if (isslip = false) 
            || (global.powerup == cs_penguin) { //If the player is not overlapping a slippery surface.
                
                //If the player's horizontal speed is equal/lower than 0.
                if (xspeed <= 0) {
                
                    //Add 'acc' to xspeed.
                    if (global.powerup != cs_frog)
                        xspeed += -0.06;
                    else {
                    
                        //If Mario is not holding or is not riding a yoshi or a kuribo shoe.
                        if ((holding == 0) && (global.mount == 0))                              
                            xspeed += -0.12;
                        else
                            xspeed += -0.06;
                    }
                }
                else { //Otherwise, if the player's speed is greater than 0.
                
                    //Add 'accskid' to xspeed;
                    xspeed += -0.15;
                }
            }
            else { //Otherwise, if the player is overlapping a slippery surface.
            
                //If the player's horizontal speed is equal/lower than 0.
                if (xspeed <= 0) {
                
                    //Add 'acc' to xspeed.
                    if (global.powerup != cs_frog)
                        xspeed += -0.03;
                    else {
                    
                        //If Mario is not holding or is not riding a yoshi or a kuribo shoe.
                        if ((holding == 0) && (global.mount == 0))                              
                            xspeed += -0.06;
                        else
                            xspeed += -0.03;
                    }
                }
                else { //Otherwise, if the player's speed is greater than 0.
                
                    //Add 'accskid' to xspeed.
                    xspeed += -0.075;
                }                                              
            }
        }
    }
    
    //Otherwise if the player is on contact with the ground, slowdown him until he stops.
    else if (yspeed == 0) { 
    
        //If the player is not overlapping a slippery surface.
        if (isslip == false)
        || ((global.mount == 2) && (global.mountcolour == 4))
        || (global.powerup == cs_penguin) {
        
            //If the player is not crouched down.
            if (!crouch) {
            
                //Reduce the player's speed until he stops.
                xspeed = max(0,abs(xspeed)-0.0375)*sign(xspeed);
                
                //Set up horizontal speed to 0 when xspeed hits the value given on 'dec'.
                if ((xspeed < 0.0375) && (xspeed > -0.0375))             
                    xspeed = 0;
            }
            else { //If the player is crouched down.
            
                //Reduce the player's speed until he stops.
                xspeed = max(0,abs(xspeed)-0.072)*sign(xspeed);
                
                //Set up horizontal speed to 0 when xspeed hits the value given on 'dec'.
                if ((xspeed < 0.072) && (xspeed > -0.072))                
                    xspeed = 0;
            }
        }
        else { //Otherwise, if the player is overlapping a slippery surface.
        
            //Reduce the player's speed until he stops.
            xspeed = max(0,abs(xspeed)-0.0046875)*sign(xspeed);
            
            //Set up horizontal speed to 0 when xspeed hits the value given on 'dec'.
            if ((xspeed < 0.0046875) && (xspeed > -0.0046875))          
                xspeed = 0;
        }
    }
}

//Otherwise, if the player's controls are disabled and the player is on contact with the ground.
else if (yspeed == 0) { 
        
    //If the player is not overlapping a slippery surface.
    if (!isslip) {
    
        //If the player is not crouched down.
        if (!crouch) {
        
            //Reduce the player's speed until he stops.
            xspeed = max(0,abs(xspeed)-0.03)*sign(xspeed);
            
            //Set up horizontal speed to 0 when xspeed hits the value given on 'dec'.
            if ((xspeed < 0.03) && (xspeed > -0.03))         
                xspeed = 0;
        }
        else { //If the player is crouched down.
        
            //Reduce the player's speed until he stops.
            xspeed = max(0,abs(xspeed)-0.072)*sign(xspeed);
            
            //Set up horizontal speed to 0 when xspeed hits the value given on 'dec'.
            if ((xspeed < 0.072) && (xspeed > -0.072))        
                xspeed = 0;
        }
    }
    else { //Otherwise, if the player is overlapping a slippery surface.
    
        //Reduce the player's speed until he stops.
        xspeed = max(0,abs(xspeed)-0.0046875)*sign(xspeed);
        
        //Set up horizontal speed to 0 when xspeed hits the value given on 'dec'.
        if ((xspeed < 0.0046875) && (xspeed > -0.0046875))   
            xspeed = 0;
    }
}

//Prevent the player from moving too fast
if (state != playerstate.jump) {

    //Check if the player has the shell powerup, it is not riding anything nor holding anything and running
    if (global.powerup == cs_shell)
    && (global.mount == 0)
    && (holding = 0)
    && (pmeter >= global.pmeter_limit) 
    && ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) {
    
        //Force sliding
        sliding = true;
    }
    
    //Check the horizontal speed
    if (xspeed > xspeedmax)
        xspeed = xspeedmax;
    if (xspeed < -xspeedmax)
        xspeed = -xspeedmax;
}

//If the player is jumping
if (((state == playerstate.jump) || (statedelay > 0)) && (groundpound != 1)) {
	
	//Switch between powerups
	switch (global.powerup) {
    
		//Tiny Mario
		case (cs_tiny): {
			
		    //Variable jumping
		    if (yspeed < -2) && (jumping == 1)
		        yadd = 0.03125;
    
		    //Otherwise, use default gravity.     
		    else {
        
		        //Use default gravity
		        yadd = 0.18125;
                
		        //End variable jumping if it never ends manually.
		        if (jumping = 1)
		            jumping = 2;
		    }			
		} break;
		
		//Other powerups
		default: {
			
		    //Variable jumping
		    if (yspeed < -2) && (jumping == 1)
		        yadd = 0.0625;
    
		    //Otherwise, use default gravity.     
		    else {
        
		        //Use default gravity
		        yadd = (groundpound = 2) ? 0.725 : 0.3625;
                
		        //End variable jumping if it never ends manually.
		        if (jumping == 1)
		            jumping = 2;
		    }
		} break;
	}
	
    //Propeller player jumping
    if (global.powerup == cs_propeller) {

        //If the player is spin jumping normally
        if ((jumpstyle != 0) && (global.mount == 0)) {
           
            //Lower the gravity
            yadd = yadd/2.25;

            //Allow the player to charge downwards
            if (((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) && (yspeed > 0)) {
            
                //Do stompstyle
                jumpstyle = 1;
                
                //Stop horizontal movement
                xspeed = 0
                
                //Cap vertical speed
                if (yspeed < 4)
                    yspeed += 0.25;            
            }
            else {
            
                //Keep stompstyle
                jumpstyle = 2;
            
                //Cap vertical speed
                if (yspeed > 1)
                    yspeed = 1;
            }

            //Play the sound when he charges downwards
            if ((input_check_pressed(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5))
                audio_play_sound(snd_propeller_spin, 0, false)
        }
    }

    //If the player is using the cape, raccoon or tanooki related powerups.
    if (global.powerup == cs_raccoon) 
	|| (global.powerup == cs_tanooki) 
	|| (global.powerup == cs_cape)
	|| (global.powerup == cs_fraccoon) 
	|| (global.powerup == cs_iraccoon) {
	
        //If ygrav is disabled.
        if (disablegrav > 0) {
			
			//Fly back down if you let go
			if (global.powerup == cs_cape)
			&& (!input_check(input.action_0))			
				disablegrav = 0;
			
			else if (global.powerup == cs_cape) {
			
				// Flight boost
				var boostflightspd = 6;
			
				// If a small period of time has passed since you started flying
				if (disablegrav <= 30) {
				
					// And your yspeed is still below the boost speed
					if (yspeed > -boostflightspd) {
				
						// Boost upwards
						yspeed -= 0.05;
					
						// Cap the boost
						if (yspeed <= -boostflightspd)
					
							yspeed = -boostflightspd;					
					}				
				}			
			}
        
			//If Mario is on the jumping state, disable grav
            if (state != playerstate.jump)
                disablegrav = 0;
				
            else {
            
                //Deny ygrav
                yadd = 0;
                
                //Enable ygrav
                disablegrav--;
            }			
        }
		
		// If the conditions are met, start flying
		if (global.powerup == cs_cape) 
		&& (flying) 
		&& (yspeed > 2)
		&& (holding == 0) 
		&& (jumpstyle == 0) 
		&& (global.mount == 0) {
			
			// If you're not running
			if (!input_check(input.action_1)) {
				
				// Stop flying
				flying = false;
				state = playerstate.jump;
			} 
			
			//Otherwise, if you are running
			else {
			
				// Create the flying Mario
				fly = instance_create_depth(x, y, depth, obj_fly);
			
				// Stop the P-meter sound pre-maturely so it's not playing when you're flying
				audio_stop_sound(snd_pmeter);
			
				with (fly) {
				
					// Attach variables
					yadd = other.yadd;
					xadd = other.xadd;
					xspeed = other.xspeed;
					yspeed = other.yspeed;
				
					// Set object reference
					owner = other.id;
				
					// Attach xscale
					xscale = other.xscale;
				
				}
				
				//Stop somersault
				somersault = false;
			
				//The flight object will take control
				enable_gravity = false;			
			}
			
		//If the criteria is met to STOP flying
		} 
		else if ((global.powerup == cs_cape) && (flying) && (yspeed > 0) && (jumpstyle != 0 || global.mount != 0)) {
		
			// Then stop flying if spin jumping, mounted, etc.
			flying = false;
			state = playerstate.jump;		
		}		
    }
    
    //Otherwise, enable ygrav.
    else
        disablegrav = 0;		
}

//Climb if overlapping a climbing surface.
if (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_climb, 0, 0))
&& ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5))
&& (holding == 0)
&& (enable_control) 
&& (global.powerup != cs_mega) {

    //Change to climbing state
    state = playerstate.climb;
	
	//Set climbing state
	climbstyle = 0;
    
    //Stop movement
    yspeed = 0;
    yadd = 0;	
}

//Check for a alternative climbing surface
var climb1 = collision_point(x, y, obj_climb_side, 0, 0);
var climb2 = collision_point(x, y+15, obj_climb_side, 0, 0);

//If there's a climbable surface
if (climb1)
&& (climb2)
&& (canhang == 0)
&& (enable_control) {
        
    //If the horizontal speed is greater than 0, face to the right
    if (xspeed > 0) {
    
        xscale = 1;
        x = climb1.x+8;
    }
        
    //Otherwise, if the horizontal speed is lower than 0, face to the left
    else if (xspeed < 0) {
    
        xscale = -1;
        x = climb1.x+8;
    }
    
    //Force set 'Climb' state
    state = playerstate.climb;
	
	//Set climbing state
	climbstyle = 1;
    
    //Stop
    xspeed = 0;
	yspeed = 0;
	yadd = 0;
    
    //Hang in
    canhang = 1;
    
    //Allow turning
    timer(allow_turn, 8);
}

//Makes the player butt-slide down slopes
if ((enable_control == true) && ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5))) {

    //If the player does have the shell or penguin suit
    if ((global.powerup == cs_shell)
    || ((global.powerup == cs_penguin) && (isslip == true)))
    && (global.mount == 0)
    && (state == playerstate.walk)
    && (!sliding)
    && ((holding == 0) || (holding == 4)) {
		  
        //Start sliding
        sliding = true;
        
        //Boost slide if overlapping a semisolid
        if (place_meeting(x, bbox_bottom+1, obj_semisolid))
        && (xspeed == 0)
            xspeed = 0.05*sign(xscale);     
    }

    //If the player is on a slope, and the above didn't happen, slide normally
    else if (collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+2, obj_slopeparent, 1, 0))
	&& (collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+2, obj_slopeparent, 1, 0).add != 0)
	&& (state != playerstate.jump)
	&& (global.powerup != cs_tiny)
    && (global.powerup != cs_frog) 
	&& (global.powerup != cs_mega) {
            
        //If the player can slide and it's not holding anything.
        if ((holding == 0) || (holding == 4)) {
        
            //Start sliding
            sliding = true;
            
            //Boost slide if overlapping a semisolid
            if (place_meeting(x, bbox_bottom+1, obj_semisolid))
                xspeed = 0.05*sign(xscale);        
        }
                
        //Otherwise, just crouch down if the player can do it.
        else
            crouch = true;
    }
	
	//Ground Pound
	if (state == playerstate.jump)
	&& (jumpstyle == 0)
	&& (crouch == 0)
	&& (yspeed > 1)
	&& (holding = 0)
	&& (wallkick == 0)
	&& (groundpound == 0) 
	&& (global.powerup != cs_tiny) 
	&& (global.powerup != cs_mega) {
	
		//Play 'Ground Pound' sound
		audio_play_sound(snd_groundpound, 0, false);
		
		//Force stop somersault
		if (somersault > 0) {
		
			angle = 0;
			somersault = 0;
		}
		
		//Stop movement
		xspeed = 0;
		yspeed = 0;
		yadd = 0;
		
		//Begin groundpound
		groundpound = 1;
	}
}

//Cape falling when button held
if ((global.powerup == cs_cape)
&& (input_check(input.action_0))
&& (wallkick < 1)
&& (state == playerstate.jump)
&& (flying == false)
&& (swimming == false)
&& (enable_control == 1)) {
		
	// Vertical speed cap
	if (yspeed > 1.5)
		yspeed = 1.5;		
}

//If the player is jumping, not ducking, not spin jumping, can control himself, is not riding anything and it's not holding a propeller block
if (state == playerstate.jump)
&& (jumpstyle == 0)
&& (enable_control == 1) {

    //If the player does have either the raccoon or the tanooki powerup
    if ((global.powerup == cs_raccoon) || (global.powerup == cs_tanooki) || (global.powerup == cs_fraccoon) || (global.powerup == cs_iraccoon))
    && (jumping != 1)
    && (wallkick < 1)
	&& (groundpound == 0)
    && (swimming == false)
    && (input_check_pressed(input.action_0))
    && (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_quicksand, 0, 0)) {
    
        //If the player is running or the pwing is active
        if (run) 
        || (global.pwing == 1) {
        
            //Play 'tail' sound.
            audio_stop_sound(snd_spin);
            audio_play_sound(snd_spin, 0, false);
            
            //Make the player able to fly for a fixed amount of seconds
			if (!flying) {
				
				flying = true;
				alarm[11] = 60 * global.flighttime;
			}
            
            //Whip tail.
            wiggle = 16;
            
            //Disable grav.
            disablegrav = 16;
            
            //Set the vertical speed.
            if (alarm[11] > 30)  
                yspeed = -1.5;
            else {
            
                if (yspeed < 0)
                    yspeed  = max(yspeed + 0.05, 0);
                else
                    yspeed = 0;
            }
        }
        
        //Otherwise, if the player is not running.
        else if (!run) { 
        
            //Play 'tail' sound.
            audio_stop_sound(snd_spin);
            audio_play_sound(snd_spin, 0, false);      
            
            //Whip tail.
            wiggle = 16;
            
            //Disable grav.
            disablegrav = 16;
            
            //Set the vertical speed.
            yspeed = 0.75;
        }
    }
    
    //Handles carrot and bee Mario's floating
    else if ((global.powerup == cs_carrot) 
    || ((global.powerup == cs_bee) && (beefly < 128)))
    && (!crouch)
    && (wallkick < 1)
    && (global.mount == 0)
    && (input_check(input.action_0)) {

        //If Mario is moving downwards
        if (yspeed > 0) {

            //Set the floating variable
            isfloating = 1;

            //Bee Mario flies upwards if the ceiling is not above him
            if (global.powerup == cs_bee)
            && (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_top, obj_solid, 0, 0)) {

                //Fly upwards
                yspeed = -1;

                //Make the bee timer tick extra because of the initial push
                beefly += 8;
            }

            //Carrot Mario floats down slowly
            else
                yspeed = 0.325;
        }

        //If Mario is not moving downwards
        else {

            //If bee Mario is floating
            if ((global.powerup == cs_bee) && (beefly < 128) && (isfloating)) {

                //Continue flying upwards
                yspeed = -1;

                //Make the bee timer tick
                beefly++

                //Slow bee Mario down if he is moving too fast
                if (xspeed > 1)
                    xspeed -= 0.1;
                if (xspeed < -1)
                    xspeed += 0.1;
            }

            //Stop floating otherwise
            else
                isfloating = false;
		}
    }
	
    //Stop floating
    else
        isfloating = false;
}

//Stop floating
else
    isfloating = false;

//If carrot or bee Mario is floating, but the sound is not playing
if ((isfloating) && (!floatnow)) {

    //Mark that the sound is playing
    floatnow = true;

    //Loop the sound
    audio_play_sound(snd_spin, 0, 1);
}

//If carrot or bee Mario is not floating, but the sound is playing
else if ((!isfloating) && (floatnow)) {

    //Mark that the sound is not playing
    floatnow = false;

    //Stop the sound
    audio_stop_sound(snd_spin)
}

//Squirrel flight
if ((global.powerup == cs_squirrel) && (holding == 0) && (wallkick == 0) && (wallready == 0) && (jumpstyle == 0)) {

    //If Mario hasn't propelled yet
    if (squirrelpropel == 0) {

        //If the jump key is pressed while moving downwards, propel upwards
        if ((yspeed > 0) && (input_check_pressed(input.action_0))) {

            //Propel
            squirrelpropel = 1;

            //Move up
            yspeed = -3.85;

            //Enable variable jumping
            jumping = 1;

            //Play 'Spin' sound
            audio_play_sound(snd_spin, 0, 0);
        }

        //If the jump key is held down, float
        else if ((yspeed > 0.5) && (input_check(input.action_0)))
            yspeed = 0.5
    }

    //Otherwise, float down more
    else if (yspeed > 2)
        yspeed = 2;
}