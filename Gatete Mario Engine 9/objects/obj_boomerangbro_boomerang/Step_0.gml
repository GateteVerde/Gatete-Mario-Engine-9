/// @description Boomerang logic

#region Manage parent

	//Keep parent active
	instance_activate_object(parent);
		
	//If the parent is eliminated...
	if (!instance_exists(parent)) {
	
		//...and this boomerang is blue
		if (sprite_index == spr_boomerangbro_boomerang_blue) {
		
			instance_create_depth(x, y-8, -2, obj_boomerang_blue);
			instance_destroy();
			exit;
		}
	}

#endregion

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
	
//If the boomerang is outside the view
if (outside_view() == true)
	instance_destroy();

//or the boomerang makes contact with the parent object
else if (ready3) && (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, parent, 0, 1))
	instance_destroy();