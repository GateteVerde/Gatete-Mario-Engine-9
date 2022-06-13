/// @description Follow Mario

//If not in contact with a slippery surface
if (!collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_slippery, 0, 0)) {
    
	//If there's horizontal motion
    if (xspeed != 0) {
    
	    //If Mario does not exist or it's at the left
	    if (!instance_exists(obj_mario))
	    || (obj_mario.x < x)
	        xspeed = -1;
	    else
	        xspeed = 1;
    }
    
    //Change direction
	alarm[11] = 60 + round(random_range(0, 60));
}