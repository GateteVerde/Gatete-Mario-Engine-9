/// @description Boomerang logic

//Manage horizontal speed.
if (ready != 0) {

    //If the boomerang is moving to the right.
    if (ready == 1) {
    
		//If the horizontal speed is greater than -2
        if (hspeed > -2)       
            hspeed += -0.075;
        else {
        
            hspeed = -2;
            vspeed = 0;
            ready = 0;
            ready2 = 1;
            ready3 = 1;
        }
    }
    
    //Otherwise, if it's moving to the left.
    else if (ready == -1) {
    
		//If the horizontal speed is lower than 2
        if (hspeed < 2)        
            hspeed += 0.075;
        else {
        
            hspeed = 2;
            vspeed = 0;
            ready = 0;
            ready2 = 1;
            ready3 = 1;
        }    
    }
}

//Manage vertical speed.
if (ready2 != 0) {

    //Move upwards / downwards.
    if (ready2 == 1) {
    
        if (vspeed > 0) {
        
            vspeed += -0.05;
        }
        else if (vspeed < 0) {
        
            vspeed += 0.05;
        }
        else
            vspeed = 0;
    }
    else if (ready2 == 2) {
    
        if (vspeed < 0.75)
            vspeed += 0.05;
        else
            vspeed = 0.75;    
    }
}

//If the boomerang is retreating and makes contact with Mario
if (ready3) {

    //Check for Mario
    var mario = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 1, 0);
    
    //If Mario exists
    if (mario) {
    
        //If the boomerang cannot be picked up
        if (canpick == false) {
        
            instance_create_depth(x, y, depth - 2, obj_smoke);
            instance_destroy();
            exit;
        }
        
        /*Otherwise, if the boomerang can be picked up
        else if (player.holding == 0) {
        
            //Create a new held boomerang
            instance_create(x+8,y,obj_boomerang_blue_up);
            
            //Destroy
            instance_destroy();
        }
		*/
    }
}