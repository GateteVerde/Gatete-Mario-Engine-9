/// @description Movement

//If Mario is on the cloud
if (player_on == true) 
&& (instance_exists(obj_mario)) {

    //Force set idle state
    obj_mario.state = playerstate.idle;

    //If player controls are enabled
    if (obj_mario.enable_control == true) {
    
        //If 'Action 2' is pressed, move faster
        if (input_check(input.action_1))
            spd_max = 2;
        else
            spd_max = 1;
            
        //Handle movement to the left
        if ((input_check(input.left)) && (!input_check(input.right))) {
        
            //Set facing direction
            xscale = -1;
            
            //If there's no collision in position
            if (collision_rectangle(obj_mario.bbox_left, bbox_top+5, obj_mario.bbox_left, bbox_bottom-4, obj_solid, 1, 0))
                hspeed = 0;
            else               
                hspeed += -0.1;               
        }
        
        //Otherwise, handle movement to the right
        else if ((input_check(input.right)) && (!input_check(input.left))) {
                
            //Set facing direction
            xscale = 1;
            
            //If there's no collision in position
            if (collision_rectangle(obj_mario.bbox_right, bbox_top+5, obj_mario.bbox_right, bbox_bottom-4, obj_solid, 1, 0))
                hspeed = 0;
            else               
                hspeed += 0.1;               
        } 
        
        //Otherwise, slow down
        else {
        
            //Slowdown
            hspeed = max(0, abs(hspeed) - 0.05) * sign(hspeed);
            
            //Stop at 0.05
            if (hspeed < 0.05)
            && (hspeed > -0.05)
                hspeed = 0;
        }
        
        //Handle movement up
        if ((input_check(input.up)) && (!input_check(input.down))) {
        
            //If there's no collision in position
            if (collision_rectangle(bbox_left, obj_mario.bbox_top-1, bbox_right, obj_mario.bbox_top, obj_solid, 1, 0))
            || (collision_rectangle(bbox_left, obj_mario.bbox_top-1, bbox_right, obj_mario.bbox_top, obj_slopeparent_ceiling, 1, 0))
                vspeed = 0;
            else
                vspeed += -0.1;
        }
                    
        //Otherwise, handle movement down
        else if ((input_check(input.down)) && (!input_check(input.up))) {
			
			//Check for a semisolid
			var check = collision_rectangle(bbox_left, obj_mario.bbox_bottom-1, bbox_right, obj_mario.bbox_bottom+1, obj_semisolid, 1, 0);
        
            //If there's no collision in position
            if ((check) && (check != mytop))
            || (collision_rectangle(bbox_left, obj_mario.bbox_bottom-1, bbox_right, obj_mario.bbox_bottom+1, obj_slopeparent, 1, 0))
                vspeed = 0;
            else
                vspeed += 0.1;
        }
            
        //Otherwise, slow down
        else {
        
            //Slowdown
            vspeed = max(0, abs(vspeed) - 0.05) * sign(vspeed);
            
            //Stop at 0.05
            if (vspeed < 0.05)
            && (vspeed > -0.05)
                vspeed = 0;
        }
        
        //Prevent hspeed from going over 2
        if (abs(hspeed) > spd_max)
            hspeed = spd_max* sign(hspeed)
        
        //Prevent vspeed from going over 2
        if (abs(vspeed) > spd_max)
            vspeed = spd_max* sign(vspeed)
    }
    else {
    
        //If the horizontal speed is not 0
        if (hspeed <> 0) {
        
            //Slow down
            hspeed = max(0, abs(hspeed) - 0.05) * sign(hspeed);
            
            //Stop at 0.05
            if (hspeed < 0.05) 
            && (hspeed > -0.05)
                hspeed = 0
        }
        
        //If the vertical speed is not 0
        if (vspeed <> 0) {
        
            //Slowdown
            vspeed = max(0, abs(vspeed) - 0.05) * sign(vspeed);
            
            //Stop at 0.05
            if (vspeed < 0.05) 
            && (vspeed > -0.05)
                vspeed = 0
        }
        
        //Prevent hspeed from going over 1
        if (abs(hspeed) > 1)
            hspeed = 1* sign(hspeed)
        
        //Prevent vspeed from going over 1
        if (abs(vspeed) > 1)
            vspeed = 1* sign(vspeed)               
    }
}

//Otherwise, slow down horizontally and vertically
else {

    //If the horizontal speed is not 0
    if (hspeed <> 0) {
    
        //Slow down
        hspeed = max(0, abs(hspeed) - 0.05) * sign(hspeed);
        
        //Stop at 0.05
        if (hspeed < 0.05) 
        && (hspeed > -0.05)
            hspeed = 0
    }
    
    //If the vertical speed is not 0
    if (vspeed <> 0) {
    
        //Slowdown
        vspeed = max(0, abs(vspeed) - 0.05) * sign(vspeed);
        
        //Stop at 0.05
        if (vspeed < 0.05) 
        && (vspeed > -0.05)
            vspeed = 0
    }
    
    //Prevent hspeed from going over 1
    if (abs(hspeed) > 1)
        hspeed = 1* sign(hspeed)
    
    //Prevent vspeed from going over 1
    if (abs(vspeed) > 1)
        vspeed = 1* sign(vspeed)    
}
