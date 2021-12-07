/// @description Make Mario sink when it's overlapping the sand.

if (other.yspeed >= 0) 
|| (other.yspeed < -2) {

    with (other) {
    
        //Stop 'P-Meter' sound
        audio_stop_sound(snd_pmeter);
                    
        //Decrement P-Meter
        flying = false;
        run = false;
        if (pmeter > 0)
            pmeter--;

        //Stop vertical speed
        yspeed = 0;
        yadd = 0;
        
        //Reset values
        event_user(15);
        
        //Make the player able to jump.
        if (input_check_pressed(input.action_0)) 
        && (!collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_top-1, obj_solid, 0, 0)) {
            
            //Play the 'Jump' sound
            audio_play_sound(snd_jump, 0, false);
            
            //Set the phase.
            state = 2;
            
            //Move upwards.
            y -= 6;
            yspeed = -3;
                        
            //Allow variable jumping
            jumping = 1;
        }
        
        //Sink slowly and cap horizontal speed
        if (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0))
        && (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+2, obj_slopeparent, 1, 0)) {
        
            //Sink slowly
            y += 0.2;
            
            //Cap horizontal speed
            if (abs(xspeed) > 0.2)
                xspeed = 0.2*sign(xscale);         
        }
        
        //Set the state of the player
        if (xspeed == 0)
            state = 0;
        else
            state = 1;
    }
}