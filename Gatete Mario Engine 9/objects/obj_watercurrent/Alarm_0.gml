/// @description Blow bubbles

//If the pswitch is not active.
if (obj_levelcontrol.pswitch_on == false) {
    
    if (direct == "Up") { //Up
    
        //Set up the position of the blown bubbles.
        if (!ready1) {
        
            a++;
            if (a = 8)
                ready1 = true;
        }
        else {
        
            a--;
            if (a = 0)
                ready1 = false;
        }
        
        //Create a bubble
        with (instance_create_depth(bbox_left+a, bbox_top-4, -4, obj_bubble_blown))
			motion_set(90, 6);
    }
    else if (direct == "Down") { //Down
    
        //Set up the position of the blown bubbles.
        if (!ready1) {
        
            a++;
            if (a = 8)
                ready1 = true;
        }
        else {
        
            a--;
            if (a = 0)
                ready1 = false;
        }
        
        //Create a bubble
        with (instance_create_depth(bbox_left+a, bbox_bottom, -4, obj_bubble_blown))
			motion_set(270, 6);    
    }
    else if (direct == "Left") { //Left
    
        //Set up the position of the blown bubbles.
        if (!ready1) {
        
            a++;
            if (a = 8)
                ready1 = true;
        }
        else {
        
            a--;
            if (a = 0)
                ready1 = false;
        }
        
        //Create a bubble
        with (instance_create_depth(bbox_left-4, bbox_top+a, -4, obj_bubble_blown))
			motion_set(180, 6);
    }
    else if (direct == "Right") { //Right
    
        //Set up the position of the blown bubbles.
        if (!ready1) {
        
            a++;
            if (a = 8)
                ready1 = true;
        }
        else {
        
            a--;
            if (a = 0)
                ready1 = false;
        }
        
        //Create a bubble
        with (instance_create_depth(bbox_right, bbox_top+a, -4, obj_bubble_blown)) 
			motion_set(0, 6);
    }
}

//Repeat the process.
alarm[0] = round(random_range(5, 10));