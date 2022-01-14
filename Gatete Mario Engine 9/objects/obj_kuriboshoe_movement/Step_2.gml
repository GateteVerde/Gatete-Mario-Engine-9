/// @description Kuribo shoe movement logic

//If the player does exist
if (instance_exists(obj_mario)) {

    if (obj_mario.state == playerstate.walk) {
    
        //If the shoe is not bouncing
        if (state == playerstate.idle) 
        && (((!input_check(input.left)) && (gamepad_axis_value(0, gp_axislh) > -0.5))
        || ((!input_check(input.right)) && (gamepad_axis_value(0, gp_axislh) < 0.5))) {
        
            //Set state
            state = 1;
        
            //If the shoe is not moving up
            if (vspeed == 0) {
            
                //Start moving
                vspeed = -1.8;
                
                //Set gravity
                gravity = 0.3;
            }
        }
        
        //Otherwise, if the shoe is bouncing
        else if (state == 1) {
        
            //If the shoe is moving down
            if (vspeed > 0) && (y > ystart-1) {
            
                //Stop vertical movement
                vspeed = 0;
                y = ystart;
                
                //End state
                state = 0;
                
                //Stop gravity
                if (gravity > 0)
                    gravity = 0;
            }
        }       
    }
    
    //Force end bounce
    else if (obj_mario.state != playerstate.walk) {
    
        //Stop vertical movement
        vspeed = 0;
        y = ystart;
        
        //End movement state
        state = 0;
        
        //Stop gravity
        if (gravity > 0)
            gravity = 0;
    }
}

//If the player does not exist, force end bounce
else {

    //Stop vertical movement
    vspeed = 0;
    y = ystart;
    
    //End movement state
    state = 0;
    
    //Stop gravity
    if (gravity > 0)
        gravity = 0;
}