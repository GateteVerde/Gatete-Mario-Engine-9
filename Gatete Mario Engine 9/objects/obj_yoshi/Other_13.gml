/// @description Check what shell does have yoshi on his mouth and give abilities

/*

if (mouthholder == obj_shell) 
&& (instance_number(obj_tongue) == 0) {
    
    //If the shell held in the mouth is a kamikaze one
    if (mouthsprite == spr_koopa_black) {
            
        //If 'Shift' is being held outside water
        if (input_check(input.action_0)) 
        && (obj_mario.swimming == false) {
        
            //If not flying and moving down, start flying.
            if (!flying)
            && (obj_mario.yspeed > 0) {
            
                flying = 1;
                alarm[3] = 1;
            }
            
            //When flying
            if (flying) {
            
                //With the player
                with (obj_mario) {
                
                    //If there's not a ceiling above the player, move up
                    if (!collision_rectangle(bbox_left, bbox_top-3, bbox_right, bbox_top, obj_solid, 1, 0)) {
                    
                        yspeed += -0.5;
                        if (yspeed < -1.5)
                            yspeed = -1.5;
                    }
                }
                
                //Animate wing
                if (global.pwing == 0)
                    flyanim += 0.25;
                else
                    flyanim = 0;
            }
            
            //Otherwise, reset fly animation
            else
                flyanim = 0;
        }
        
        //Otherwise, reset flight
        else {
        
            audio_stop_sound(snd_yoshi_lick);
            flying = 0;
            flyanim = 0;
        }

        //If the player lands after a jump, stomp
        if (stateprev == 2)
        && (obj_mario.state != 2)        
            instance_create_depth(x, y, -2, obj_stomp);
    }
    
    //If yoshi has a yellow shell in mouth
    if (colour == 2)
    || (mouthsprite == spr_shell_yellow_down) {
                    
        //If the player lands after a jump, stomp
        if (stateprev == 2)
        && (obj_mario.state != playerstate.jump)        
            instance_create(x, y, -2, obj_stomp);
    }
    
    //If yoshi has a blue shell in mouth
    if (colour == 3) 
    || (mouthsprite == spr_shell_blue_down) {
    
        //If 'Shift' is being held outside water
        if (input_check(input.action_0)) 
        && (obj_mario.swimming == false) {
        
            //If not flying and moving down, start flying.
            if (!flying)
            && (obj_mario.yspeed > 0) 
            && (obj_mario.flying = 0) {
            
                flying = 1;
                alarm[3] = 1;
            }
            
            //When flying
            if (flying) {
            
                //With the player
                with (obj_mario) {
                
                    //If there's not a ceiling above the player, move up
                    if (!collision_rectangle(bbox_left, bbox_top-3, bbox_right, bbox_top, obj_solid, 1, 0)) {
                    
                        yspeed += -0.5;
                        if (yspeed < -1.5)
                            yspeed = -1.5;
                    }
                }
                
                //Animate wing
                if (global.pwing == 0)
                    flyanim += 0.25;
                else
                    flyanim = 0;
            }
            
            //Otherwise, reset fly animation
            else
                flyanim = 0;
        }
        
        //Otherwise, reset flight
        else {
        
            audio_stop_sound(snd_yoshi_lick);
            flying = 0;
            flyanim = 0;
        }    
    }    
}

*/

//Remember last state
stateprev = obj_mario.state;    