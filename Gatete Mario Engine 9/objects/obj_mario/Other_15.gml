/// @description Mario's slide behaviour

//Stop sliding if using tiny or mega powerup
if (global.powerup == cs_tiny)
|| (global.powerup == cs_mega) {

	sliding = false;
	exit;
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

//Force stop crouching down
crouch = false;

//Check if there's a collision below and if Mario is on the ground
if (yadd == 0)
&& (!collision_point(x, bbox_bottom, obj_wanderingpit, 1, 0))
&& ((collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1.5, obj_semisolid, 0, 0))
|| (collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1.5, obj_enemy_top, 0, 0))
|| (collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1.5, obj_slopeparent, 1, 0))) {

    //If the player is not moving vertically
    if (yspeed >= 0) {

        //Figure out if the player is standing or walking
        if (xspeed == 0)
            state = playerstate.idle;
        else 
            state = playerstate.walk;
    
        //Reset state delay
        statedelay = 0;
    }
    
    //Otherwise, set 'Jump' state
    else if (yspeed < 0)
        state = playerstate.jump;
}

//the player is jumping if there's no ground below him.
else {

    //Delay the change to the jump state
    if (statedelay > 4)
        state = playerstate.jump;
    else
        statedelay++;
}

//Prevent the player from falling too fast.
if (yspeed > 4)
    yspeed = 4;
    
//Prevent the player from sliding too fast.
xspeedmax = 2.5;

//You can't slide down slopes while having the frog suit, so make him stop.
if (global.powerup == cs_frog)
    sliding = false;

//Make the player able to jump.
if (enable_control == true) { //If the player's controls are not disabled.
    
    //Make the player able to jump when is on contact with the ground.
    if (input_check_pressed(input.action_0))
    && (jumping == 0)
    && (yspeed == 0) 
    && (state != playerstate.jump) { //If the 'Shift' key is pressed and the player is not jumping.
		
		//Play 'Jump' sound
        audio_play_sound(snd_jump, 0, false);
                
        //Set the vertical speed.
        yspeed = -3.4675;
                
        //Make the player able to vary the jump.
        jumping = 1;             
        
        //Switch to jump state
        state = playerstate.jump;        
		
		//If the player does have the shell or penguin suit.
        if (global.powerup == cs_shell) 
        || (global.powerup == cs_penguin) {
        
            //If the horizontal speed is lower than the max
            if (abs(xspeed) != xspeedmax)
                sliding = false;             
        }
        
        //Otherwise, if the player does not have any of those powerups
        else
            sliding = false; 
    }
    
    //Check if the player should still be variable jumping
    if (input_check_released(input.action_0))
    && (jumping == 1)
        jumping = 2;
}

//Collision with a slope
var _slope = collision_rectangle(bbox_left, bbox_bottom-2, bbox_right, bbox_bottom+2, obj_slopeparent, 1, 0);

//Accelerate when in contact with a slope
if (_slope) 
&& (_slope.add != 0) {

    //If the player does have the shell or penguin suit.
    if ((global.powerup == cs_shell) || (global.powerup == cs_penguin)) {
    
        //If the horizontal speed is lower than the max
        if (abs(xspeed) != xspeedmax)          
			xspeed += _slope.add;
    }
    
    //Otherwise, change direction when allowed
    else
		xspeed += _slope.add;
}

//Make the player decelerate when not sliding down a slope.
else {

    //If the player is on contact with the floor.
    if (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0)) {
    
        //If the player is mounted in a yoshi, ignore special slides
        if (global.mount != 0) {
        
            //If the player is not on contact with a slippery surface.
            if (isslip == false) {
            
                //Slowdown
                xspeed = max(0,abs(xspeed)-0.05)*sign(xspeed);
                if ((xspeed > -0.05) && (xspeed < 0.05)) {
                
                    //Stop horizontal speed.
                    xspeed = 0;
                    
                    //End combo
                    hitcombo = 0;
                    
                    //Stop sliding behaviour
                    sliding = false;
                }
            }
            
            //Otherwise, if the player is on contact with a slippery surface.
            else if (isslip == true) {
            
                //Slowdown
                xspeed = max(0,abs(xspeed)-0.0125)*sign(xspeed);
                if ((xspeed > -0.0125) && (xspeed < 0.0125)) {
                
                    //Stop horizontal speed.
                    xspeed = 0;
                    
                    //End combo
                    hitcombo = 0;
                    
                    //Stop sliding behaviour
                    sliding = false;
                }        
            }        
        }
        
        //Otherwise, do normal slide
        else {
    
            //If the player does have the shell or penguin suit
            if (global.powerup == cs_shell) 
            || (global.powerup == cs_penguin) {
            
                //If the horizontal speed is lower than the max
                if (abs(xspeed) != xspeedmax) {
            
                    //If the player is not on contact with a slippery surface.
                    if (isslip == false) {
                    
                        //Slowdown
                        xspeed = max(0,abs(xspeed)-0.05)*sign(xspeed);
                        if ((xspeed > -0.05) && (xspeed < 0.05)) {
                        
                            //Stop horizontal speed.
                            xspeed = 0;
                            
                            //End combo
                            hitcombo = 0;
                            
                            //Stop sliding behaviour
                            sliding = false;
                        }
                    }
                    
                    //Otherwise, if the player is on contact with a slippery surface.
                    else if (isslip == true) {
                    
                        //Slowdown
                        xspeed = max(0,abs(xspeed)-0.0125)*sign(xspeed);
                        if ((xspeed > -0.0125) && (xspeed < 0.0125)) {
                        
                            //Stop horizontal speed.
                            xspeed = 0;
                            
                            //End combo
                            hitcombo = 0;
                            
                            //Stop sliding behaviour
                            sliding = false;
                        }  
                    }
                }
                
                //Otherwise, slow down if the penguin suit is worn
                else if (global.powerup == cs_penguin) {
                
                    //If the player is not on contact with a slippery surface.
                    if ((isslip == false) || (abs(xspeed) != xspeedmax)) {
                    
                        //Slowdown
                        xspeed = max(0,abs(xspeed)-0.05)*sign(xspeed);
                        if ((xspeed > -0.05) && (xspeed < 0.05)) {
                        
                            //Stop horizontal speed.
                            xspeed = 0;
                            
                            //End combo
                            hitcombo = 0;
                            
                            //Stop sliding behaviour
                            sliding = false;
                        }
                    }
                    
                    //Otherwise, if the player is on contact with a slippery surface.
                    else if (isslip == true) {
                    
                        //Slowdown
                        xspeed = max(0,abs(xspeed)-0.0125)*sign(xspeed);
                        if ((xspeed > -0.0125) && (xspeed < 0.0125)) {
                        
                            //Stop horizontal speed.
                            xspeed = 0;
                            
                            //End combo
                            hitcombo = 0;
                            
                            //Stop sliding behaviour
                            sliding = false;
                        }  
                    }                                    
                }
            }
            
            //Otherwise, stop sliding
            else {
            
                //If the player is not on contact with a slippery surface.
                if (isslip == false) {
                
                    //Slowdown
                    xspeed = max(0,abs(xspeed)-0.05)*sign(xspeed);
                    if ((xspeed > -0.05) && (xspeed < 0.05)) {
                    
                        //Stop horizontal speed.
                        xspeed = 0;
                        
                        //End combo
                        hitcombo = 0;
                        
                        //Stop sliding behaviour
                        sliding = false;
                    }
                }
                
                //Otherwise, if the player is on contact with a slippery surface.
                else if (isslip == true) {
                
                    //Slowdown
                    xspeed = max(0,abs(xspeed)-0.0125)*sign(xspeed);
                    if ((xspeed > -0.0125) && (xspeed < 0.0125)) {
                    
                        //Stop horizontal speed.
                        xspeed = 0;
                        
                        //End combo
                        hitcombo = 0;
                        
                        //Stop sliding behaviour
                        sliding = false;
                    }  
                }                            
            }
        }
    }
}

//End sliding when the 'Down' key is no longer pressed and the player is on ground.
if (((!input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) && (state < 2)) {

    //If the player has the shell powerup
    if (global.powerup == cs_shell)
        sliding = false;
        
    //Otherwise, if the player does have the penguin suit and the horizontal speed is not at the max peak.
    else if (global.powerup == cs_penguin) && (abs(xspeed) == xspeedmax)
        sliding = false;
}

//Prevent the player from sliding too fast.
if (xspeed > xspeedmax)
    xspeed = xspeedmax;
if (xspeed < -xspeedmax)
    xspeed = -xspeedmax;
    
//If the player is jumping
if ((state == playerstate.jump) || (statedelay > 0)) {
    
    //Variable jumping
    if (yspeed < -2) && (jumping == 1)
        yadd = 0.0625;
    
    //Otherwise, use default gravity.     
    else {
		
		//Set gravity
		if (global.powerup == cs_shell) {
			
			//If there's no gravity
			if (yadd == 0) {
			
				move_snap(8, 2);
				yadd = 0.6;
			}
			yadd = 0.4;
		}
		else {
			
			yadd = 0.3625;
		}
        
        //End variable jumping if it never ends manually.
        if (jumping = 1)
            jumping = 2;
    }
}

//Set facing direction if the player has either the shell or penguin powerup
if ((global.powerup == cs_shell)
|| (global.powerup == cs_penguin)) {

    if (xspeed > 0)
        xscale = 1;
    if (xspeed < 0)
        xscale = -1;
}