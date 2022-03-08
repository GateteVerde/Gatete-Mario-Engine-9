/// @description Manage Yoshi Actions

#region YOSHI LOGIC

	//If Mario does exist.
	if (instance_exists(obj_mario)) {
		
		//Update flashing
		isflashing = obj_mario.isflashing;
		
		//Force dismount yoshi if you have tiny powerup
		if (global.powerup == cs_tiny) {
			
			event_user(1);
			exit;
		}

	    //Snap into Mario
	    x = obj_mario.x;
	    y = obj_mario.y;
    
	    //Force Mario to be invisible
	    obj_mario.visible = 0;
    
	    //Force Mario to hold something
	    obj_mario.holding = 4;
		
		//Force depth to be equal as Mario's depth
		depth = obj_mario.depth+1;
        
	    //If Yoshi is not licking and control is pressed.
	    if (input_check_pressed(input.action_1))
	    && (licking == 0)
	    && (obj_mario.enable_control == true) 
		&& (obj_mario.enable_gravity == true) {
    
	        //If the mouth is empty, start licking.
	        if (mouthholder == noone) {
        
	            //Play 'Lick' sound
	            if (!audio_is_playing(snd_yoshi_lick)) {
            
	                audio_play_sound(snd_yoshi_lick, 0, false);
	            }
            
	            //Start licking
	            licking = 1;
	            alarm[0] = 5;
            
	            //Animation
	            anim = 0;
            
	            //Lock the tounge in position
	            if (((input_check(input.up)) || (gamepad_axis_value(0, gp_axislv) < -0.5)) || (jumping > 0)) {
            
	                //If Mario is not crouched down
	                if (!obj_mario.crouch)
	                    locked = 1;
	                else
	                    locked = 2;
	            }
	            else
	                locked = 2;
	        }
        
	        //Otherwise, spit out the item.
	        else
	            event_user(0);
	    }
    
	    //Make Yoshi flutter if moving down and if Mario does not have either the raccoon or tanooki powerup
	    if (input_check(input.action_0))
	    && (flying == 0)
		&& (obj_mario.crouch == false)
	    && (obj_mario.swimming == false) 
	    && (global.powerup != cs_raccoon)
	    && (global.powerup != cs_tanooki) 
		&& (global.powerup != cs_fraccoon) 
		&& (global.powerup != cs_iraccoon) {
    
	        //If Yoshi can flutter and it is moving down
	        if (flutter == 0)
	        && (obj_mario.yspeed >= 2.5) {
        
	            //Play 'Hover' sound
	            audio_play_sound(snd_yoshi_hover, 0, false);
         
	            //Allow fluttering   
	            flutter = 1;
	        }
            
	        //If Yoshi is fluttering
	        else if (flutter = 1) {
        
	            //Increment flutter time
	            fluttertime += 2;
            
	            //If flutter time is lower than 120
	            if (fluttertime < 120) {
            
	                //Make Mario ascend
	                with (obj_mario) {
                
	                    //Disable gravity
	                    yadd = 0;
                
	                    //Increment vertical movement
	                    if (yspeed > 0)
	                        yspeed -= 0.15;
	                    else {
                    
	                        yspeed -= 0.05;
	                        if (yspeed < -1.5)
	                            yspeed = -1.5;
	                    }
	                }
	            }
	            else {
            
	                //Stop 'Hover' sound
	                audio_stop_sound(snd_yoshi_hover);
            
	                //End flutter
	                flutter = 2;
                
	                //Allow flutter after a while
	                alarm[4] = 15;
	            }
	        }
	    }
	    else if (flutter == 1) 
	    || (obj_mario.yspeed < -1.6) {
            
	        //Stop 'Hover' sound
	        audio_stop_sound(snd_yoshi_hover);
            
	        //End flutter
	        flutter = 2;
        
	        //Allow flutter after a while
	        alarm[4] = 15;
	    }
    
	    //Force end flutter if not jumping
	    if (flutter == 1)
	    && (obj_mario.state != playerstate.jump) {
            
	        //Stop 'Hover' sound
	        audio_stop_sound(snd_yoshi_hover);
            
	        //End flutter
	        flutter = 2;
        
	        //Allow flutter after a while
	        alarm[4] = 15
	    }
    
	    //Manage Yoshi state
	    event_user(3);
    
	    //Mask
	    obj_mario.mask_index = spr_mask_mario_big;
    
	    //Check if Mario is jumping and make yoshi set up his jump pose if so.
	    if ((obj_mario.state == playerstate.jump) || (obj_mario.statedelay > 0))    
	        jumping = 1;
        
	    //Otherwise, if Mario is not jumping
	    else {
    
	        //Stop 'Hover' sound
	        audio_stop_sound(snd_yoshi_hover);
        
	        //End jumping
	        jumping = 0;
        
	        //Allow fluttering        
	        flutter = 0;
	        if (fluttertime > 0)
	            fluttertime = 0;
	    }
	}

	//Otherwise, if Mario does not exist.
	else {

	    //If Mario has cleared a level, do not hold anything on the mouth and stop sounds from playing
	    if (instance_exists(obj_mario_clear)) {
    
			//If there's something inside Yoshi's mouth
	        if (mouthholder != noone) {
        
	            mouthholder = noone;
	            mouthsprite = noone;
	        }
			
			//Stop 'Flying' sound
			audio_stop_sound(snd_yoshi_lick);

			//Stop 'Flutter' sound
			audio_stop_sound(snd_yoshi_hover);

			//Destroy Yoshi's tongue if it exists
			with (obj_yoshi_tongue) {
				
				instance_destroy();
			}
	    }

	    //Find a suitable player
	    follow_which_mario();
    
	    //If said player object exists, follow him
	    if (instance_exists(follow)) {
    
	        //Snap onto this object
	        x = follow.x;
	        y = follow.y;
        
	        //Set the same depth as the other object
	        depth = follow.depth;
	    }
	}

	//Stop 'Flutter' sound if yoshi is not fluttering
	if (flutter != 1)
	&& (audio_is_playing(snd_yoshi_hover))
	    audio_stop_sound(snd_yoshi_hover);
		
#endregion

#region YOSHI ANIMATION

	//If Mario does exist.
	if (instance_exists(obj_mario)) {

	    //If yoshi is licking.
	    if (licking) {
    
	        //If the 'Up' key is being held or Yoshi is jumping.
	        if (locked == 1) {
        
	            //If yoshi is fluttering
	            if (flutter == 1) {
            
	                //Set the sprite
	                sprite_index = spr_yoshi_lick_flutter;                         
                
	                //Animate
	                image_speed = 0.3;                    
	            }
            
	            //Otherwise
	            else {
            
	                //Set the sprite
	                sprite_index = spr_yoshi_swallow;
                
	                //Do not animate
	                image_speed = 0;
                
	                //Set the frame
	                if (obj_mario.yspeed != 0) {
                
	                    if (obj_mario.yspeed < 0)
	                        image_index = 1;
	                    else if (obj_mario.yspeed > 0)
	                        image_index = 2;
	                }
	                else
	                    image_index = 0;
	            }
	        }
            
	        //Otherwise, if Mario is not moving vertically
	        else {
            
	            //Set the sprite
	            sprite_index = spr_yoshi_lick;
            
	            //Do not animate
	            image_speed = 0;
            
	            //Set the frame
	            image_index = anim;
	        }
	    }
    
	    //Otherwise, if Yoshi is not licking.
	    else if (!licking) {
    
	        //If Mario is crouched down or it's sliding down a slope.
	        if (obj_mario.crouch) 
	        || (obj_mario.sliding) {
        
	            //If Yoshi is holding something on his mouth.
	            if (mouthholder != noone) {
            
	                //Set the sprite
	                sprite_index = spr_yoshi_fm_wait;
        
	                //Do not animate
	                image_speed = 0;
	                image_index = 2;
	            }
            
	            //Otherwise, if Yoshi is not holding anything on his mouth.
	            else if (mouthholder == noone) {
            
	                //Set the sprite
	                sprite_index = spr_yoshi_wait;
                
	                //Do not animate
	                image_speed = 0;
	                image_index = 0;
	            }
	        }
        
	        //Otherwise, if Mario is not crouched down.
	        else {
    
	            //If Mario is idle.
	            if (obj_mario.state == playerstate.idle) {
            
	                //If Yoshi is holding something on his mouth.
	                if (mouthholder != noone) {
                
	                    //Set the sprite
	                    sprite_index = spr_yoshi_fm;
                    
	                    //Do not animate
	                    image_speed = 0;
	                    image_index = 0;
	                }
                
	                //Otherwise, if Yoshi is not holding anything on his mouth.
	                else if (mouthholder == noone) {
                
	                    //Set the sprite
	                    sprite_index = spr_yoshi;
                    
	                    //Do not animate
	                    image_speed = 0;
	                    image_index = 0;                
	                }
	            }
            
	            //Otherwise, if Mario is moving.
	            else if (obj_mario.state == playerstate.walk) {
            
	                //If Yoshi is holding something on his mouth.
	                if (mouthholder != noone) {
                
	                    //Set the sprite
	                    sprite_index = spr_yoshi_fm;
                    
	                    //Animate
	                    image_speed = (obj_mario.isslip) ? 0.130+abs(obj_mario.xspeed)/7.5 : 0.065+abs(obj_mario.xspeed)/7.5;
	                }
                
	                //Otherwise, if Yoshi is not holding anything on his mouth.
	                else if (mouthholder == noone) {
                
	                    //Set the sprite
	                    sprite_index = spr_yoshi;
                    
	                    //Animate
	                    image_speed = (obj_mario.isslip) ? 0.130+abs(obj_mario.xspeed)/7.5 : 0.065+abs(obj_mario.xspeed)/7.5;                 
	                }
	            }
            
	            //Otherwise, if Mario is moving upwards.
	            else if (obj_mario.state == playerstate.jump) {
            
	                //If Yoshi is holding something on his mouth.
	                if (mouthholder != noone) {
                
	                    //If Yoshi is fluttering
	                    if (flutter == 1) {
                    
	                        //Set the sprite
	                        sprite_index = spr_yoshi_fm_flutter;
                        
	                        //Animate
	                        image_speed = 0.3;
	                    }
	                    else {
                
	                        //Set the sprite
	                        sprite_index = spr_yoshi_fm_jump;
                        
	                        //Do not animate
	                        image_speed = 0;
                        
	                        //Set the frame
	                        if (obj_mario.yspeed < 0)
	                            image_index = 0;
	                        else
	                            image_index = 1;
	                    }
	                }
                
	                //Otherwise, if Yoshi is not holding anything on his mouth.
	                else if (mouthholder == noone) {
                
	                    //If Yoshi is fluttering
	                    if (flutter == 1) {
                    
	                        //Set the sprite
	                        sprite_index = spr_yoshi_flutter;                         
                        
	                        //Animate
	                        image_speed = 0.3;                                      
	                    }
                    
	                    else {
                    
	                        //Set the sprite
	                        sprite_index = spr_yoshi_jump;
                        
	                        //Do not animate
	                        image_speed = 0;
                        
	                        //Set the frame
	                        if (obj_mario.yspeed < 0)
	                            image_index = 0;
	                        else
	                            image_index = 1;   
	                    }                                 
	                }
	            }
	        }
	    }
	}
	
	//Otherwise, if Mario is warping through a pipe
	else if (instance_exists(obj_mario_warp)) {
	   
        //If the player is not moving vertically
        if (obj_mario_warp.vspeed == 0) {
    
            //If Yoshi is holding something on his mouth.
            if (mouthholder != noone) {
            
                //Set the sprite
                sprite_index = spr_yoshi_fm_wait;
                
                //Animate
                image_speed = 0.2;
            }
            
            //Otherwise, if Yoshi is not holding anything on his mouth.
            else if (mouthholder == noone) {
            
                //Set the sprite
                sprite_index = spr_yoshi_wait;
                
                //Animate
                image_speed = 0.2;               
            }
        }
        else {
        
            //If Yoshi is holding something on his mouth.
            if (mouthholder != noone) {
            
                //Set the sprite
                sprite_index = spr_yoshi_warp;
                
                //Do not animate
                image_speed = 0;
                image_index = 1;
            }
            
            //Otherwise, if Yoshi is not holding anything on his mouth.
            else if (mouthholder == noone) {
            
                //Set the sprite
                sprite_index = spr_yoshi_warp;
                
                //Do not animate
                image_speed = 0;
                image_index = 0;
            }
        }		
	}
#endregion

//If Mario does exist
if (instance_exists(obj_mario)) {
    
    //If Yoshi is extending it's tongue
    if (licking) {
    
        //If Mario has either the raccoon or tanooki powerup
        if (global.powerup == cs_raccoon) || (global.powerup == cs_tanooki) {
        
            //If Yoshi is jumping
            if (jumping == 0) {
            
                //If Yoshi is crouching to lick something
                if (sprite_index == spr_yoshi_lick)
                    f = 4+obj_mario.wiggle/4;
                else
                    f = 0+obj_mario.wiggle/4;
            }
            
            //Otherwise
            else {
            
                if (locked == 2)
                    f = 4+obj_mario.wiggle/4;
                else
                    f = 0+obj_mario.wiggle/4;
            }
        }
        
        //Otherwise, if Mario does not have any of the above powerups.
        else {
        
            //If Yoshi is not jumping
            if (jumping == 0) {
                
                //If Yoshi is crouching to lick something
                if (sprite_index == spr_yoshi_lick)
                    f = 1;
                else
                    f = 0;
            }
            
            //Otherwise
            else {
            
                if (locked == 2)
                    f = 1;
                else
                    f = 0;
            }
        }
    }
    
    //Otherwise, if Yoshi is not extending it's tongue
    else {
    
        //If Mario has either the raccoon or tanooki powerup.
        if (global.powerup == cs_raccoon) || (global.powerup == cs_tanooki) {
        
            //If Mario is crouched down or sliding down a slope
            if (obj_mario.crouch) || (obj_mario.sliding)
                f = 4+obj_mario.wiggle/4;
            
            //Otherwise...
            else            
                f = 0+obj_mario.wiggle/4;
        }
    
        else {
        
            //If Mario is crouched down or sliding down a slope
            if (obj_mario.crouch) || (obj_mario.sliding) 
                f = 1;
    
            //Otherwise, set the default frame
            else          
                f = 0;
        }
    }
    
    //Set the facing direction
    image_xscale = obj_mario.xscale;
}

//If Mario exists
if (instance_exists(obj_mario)) {

	//Set up the y position for Mario
	if (sprite_index == spr_yoshi)
	|| (sprite_index == spr_yoshi_fm) {

	    if (image_index > 0.99)
	        myy = 1;
	    else
	        myy = 0;
	}
	else
	    myy = 0;
}
else if (instance_exists(obj_mario_clear)) {

	//If Mario is moving horizontally
	if (obj_mario_clear.xspeed > 0) {
		
		if (obj_mario_clear.anim > 0.99)
			myy = 1;
		else
			myy = 0;
	}
	else
		myy = 0;
}