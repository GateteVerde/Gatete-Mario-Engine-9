/// @description Mario's swim behaviour

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

//Reset player local variables
event_user(15);

//Check if there's a collision below and if Mario is on the ground
if ((collision_rectangle(bbox_left, bbox_bottom+1, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0))
|| (collision_rectangle(x-1, bbox_bottom+1, x+1, bbox_bottom+1, obj_slopeparent, 1, 0)))
&& (yadd == 0) {
	
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

//Make the player uncrouch if jumping.
if ((state == playerstate.jump) && (crouch))
    crouch = false;

//Handle the player movement.
if (enable_control == true) && (inwall == 0) { //If the player controls are not disabled.

    //If the player does not have either the frog or penguin powerup and it's not holding anything.
    if ((global.powerup == cs_frog)
    || (global.powerup == cs_penguin)) 
    && (holding == 0) {
    
        //Deny gravity at all times
        yadd = 0;
        
        //If the 'Control' key is pressed, move faster.
        if (input_check(input.action_1))  
            xspeedmax = 2;
        
        //Otherwise, move slower.
        else        
            xspeedmax = 1;
        
        //Handle horizontal movement
        //If the left key is pressed and the player is not crouched down.
        if (((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) && (!crouch) && (!input_check(input.right))) {
        
            //Set the horizontal speed
            xspeed += -0.2;
            
            //Set the facing direction
            xscale = -1;
            
            //Set the swimming direction
            swimtype = 0;
        }
        
        //Otherwise, if the right key is pressed and the player is not crouched down.
        else if (((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) && (!crouch) && (!input_check(input.left))) {
        
            //Set the horizontal speed
            xspeed += 0.2;
            
            //Set the facing direction
            xscale = 1;
            
            //Set the swimming direction
            swimtype = 0;
        }
        
        //Otherwise, stop the player.
        else {
        
            //Reduce the player's speed until he stops.
            xspeed = max(0,abs(xspeed)-0.2)*sign(xspeed);
            
            //Set up horizontal speed to 0 when xspeed hits 0.2
            if ((xspeed < 0.2) && (xspeed > -0.2))                
                xspeed = 0;
        }
            
        //If the 'Up' key is pressed.
        if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {
        
            //Move upwards
            yspeed += -0.2;
            
            //Set the swimming animation.
            if (xspeed == 0)
                swimtype = 1;
        }
        
        //Otherwise, if the 'Down' key is pressed.
        else if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5)) {
        
            //Set the swimming animation
            if (xspeed == 0)
                swimtype = 2;
            
            //Move downwards
            if (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0))
                yspeed = 0;
            else
                yspeed += 0.2;
        }
        else {
    
            //Reduce the player's speed until he stops.
            yspeed = max(0,abs(yspeed)-0.2)*sign(yspeed);
            
            //Set up vertical speed to 0 when yspeed hits 0.2
            if ((yspeed < 0.2) && (yspeed > -0.2))                
                yspeed = 0;
        }
            
        //Prevent the player from moving horizontally too fast.
        if (xspeed > xspeedmax) 
            xspeed = xspeedmax;
        if (xspeed < -xspeedmax) 
            xspeed = -xspeedmax;
            
        //Prevent the player from moving vertically too fast.
        if (yspeed > xspeedmax) 
            yspeed = xspeedmax;
        if (yspeed < -xspeedmax) 
            yspeed = -xspeedmax;        
    }
    
    //Otherwise, if the player does not have any of the above powerups.
    else {
    
        //Prevent the player from swimming too fast.
        if (yspeed < -2) 
            yspeed = -2;
            
        //Prevent the player from diving too fast.
        if (yspeed > 4)
            yspeed = 4;
        
        //Set up the maximum horizontal speed.
        if (state == playerstate.jump) {
        
            //If the player is wearing the blue shell
            if (global.powerup == cs_shell)
                xspeedmax = 2.5;
            else
                xspeedmax = 2;
        }
        else
            xspeedmax = 0.5;
            
        //If the player presses the 'Shift' key.
        if (input_check_pressed(input.action_0)) {
        
            //Play 'Swim' sound
            audio_play_sound(snd_swim, 0, false);
			
            //Set the state
            state = playerstate.jump;
			
			//Set the vertical speed
			yspeed = -1.5;
        
            //Swim higher if the 'Up' key is pressed.
            if ((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) {
            
                //Set the vertical speed
                yspeed -= 1;
                
                //If a kuribo shoe is being ridden, dismount from it.
                if (global.mount == 2)
                    with (obj_kuriboshoe) event_user(0);
                
                //Otherwise, if a Yoshi is being ridden, dismount from it.
                if (global.mount == 1)
                    with (obj_yoshi) event_user(1);
            }
            
            //Swim lower if the 'Down' key is pressed.
            else if ((input_check(input.down)) || (gamepad_axis_value(0, gp_axislv) > 0.5))
                yspeed += 1;
        }
        
        //Handle horizontal movement.
        //If the player presses the 'Right' key and the 'Left' key is not held.
        if (((input_check(input.right)) || (gamepad_axis_value(0, gp_axislh) > 0.5)) && (!input_check(input.left)) && (!crouch)) {
            
            //Set the facing direction
            if ((holding == 2) && (xscale != 1)) {
            
                turning = 1;
                timer(turning_end, 12, false);
            }
            xscale = 1;
            
            //If there's NOT a wall on the way.
            if (!collision_rectangle(bbox_right, bbox_top+4, bbox_right+1, bbox_bottom-1, obj_solid, 1, 0)) {
				
				//If Mario has the shell powerup
				if (global.powerup == cs_shell) {
            
	                //Set the horizontal speed.
	                if (xspeed >= 0) //If the player horizontal speed is equal/greater than 0.        
	                    xspeed += 0.075;
                
	                //Otherwise, If the player horizontal speed is lower than 0.
	                else         
	                    xspeed += 0.1;					
				}
				
				//Otherwise
				else {
            
	                //Set the horizontal speed.
	                if (xspeed >= 0) //If the player horizontal speed is equal/greater than 0.        
	                    xspeed += 0.025;
                
	                //Otherwise, If the player horizontal speed is lower than 0.
	                else         
	                    xspeed += 0.075;
				}
            }
        }
        
        //If the player presses the 'Left' key and the 'Right' key is not held.
        else if (((input_check(input.left)) || (gamepad_axis_value(0, gp_axislh) < -0.5)) && (!input_check(input.right)) && (!crouch)) {
            
            //Set the facing direction
            if ((holding == 2) && (xscale != -1)) {
            
                turning = 1;
                timer(turning_end, 12, false);
            }
            xscale = -1;
            
            //If there's NOT a wall on the way.
            if (!collision_rectangle(bbox_left-1, bbox_top+4, bbox_left, bbox_bottom-1, obj_solid, 1, 0)) {
            
				//If Mario has the shell powerup
				if (global.powerup == cs_shell) {
					
					//Set the horizontal speed.
	                if (xspeed <= 0) //If the player horizontal speed is equal/lower than 0.        
	                    xspeed += -0.05;
                    
	                //Otherwise, If the player horizontal speed is greater than 0. 
	                else        
	                    xspeed += -0.075;					
				}
				
				//Otherwise
				else {
					
	                //Set the horizontal speed.
	                if (xspeed <= 0) //If the player horizontal speed is equal/lower than 0.        
	                    xspeed += -0.025;
                    
	                //Otherwise, If the player horizontal speed is greater than 0. 
	                else        
	                    xspeed += -0.05;
				}
            }      
        }
        
        //Otherwise, if neither of the 'Left' key or 'Right' key is not held.
        else if (yspeed == 0) { //If the player is on the ground.
        
            //Reduce the player speed until he stops.
            xspeed = max(0,abs(xspeed)-0.007)*sign(xspeed);
            
            //Set up horizontal speed to 0 when xspeed hits the value given on 'dec_swim'.
            if ((xspeed < 0.007) && (xspeed > -0.007))      
                xspeed = 0;     
        }
    }
}

//Otherwise, If the player controls are disabled.
else if (enable_control == false) {

    //Reduce the player speed until he stops.
    xspeed = max(0,abs(xspeed)-0.007)*sign(xspeed);
    
    //Set up horizontal speed to 0 when xspeed hits the value given on 'dec_swim'.
    if ((xspeed < 0.007) && (xspeed > -0.007))    
        xspeed = 0;        
}

//Prevent the player from sliding too fast.
if (xspeed > xspeedmax)
    xspeed = xspeedmax;
if (xspeed < -xspeedmax)
    xspeed = -xspeedmax;
    
//Apply ygrav
if ((state == playerstate.jump) || (statedelay > 0))
    yadd = 0.025;      