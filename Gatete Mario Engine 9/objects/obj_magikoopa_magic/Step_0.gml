/// @description Magikoopa Magic Spell logic

//Handle psuedo movement
if (freeze == false) {
	
	x += xspeed;
	y += yspeed;
}

//No gravity
yadd = 0;

#region LOGIC

	//If moving down...
	if (yspeed > 0) {
	
		//...and there's a collision in position.
		if (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_semisolid, 0, 0))
		|| (collision_rectangle(bbox_left, bbox_bottom, bbox_right, bbox_bottom+1, obj_slopeparent, 1, 0))
			event_user(0);
	}
	
	//Otherwise, if moving up...
	else if (yspeed < 0) {
	
		//...and there's a collision in position
		if (collision_rectangle(bbox_left, bbox_top-1, bbox_right, bbox_top, obj_solid, 1, 0))
			event_user(0);
	}
	
	//Wall collision
	if ((xspeed < 0) && (collision_rectangle(bbox_left, bbox_top, bbox_left, bbox_bottom, obj_solid, 1, 0)))
	|| ((xspeed > 0) && (collision_rectangle(bbox_right, bbox_top, bbox_right, bbox_bottom, obj_solid, 1, 0)))
		event_user(0);
	
#endregion

//Check for a flip block
var flip = collision_rectangle(bbox_left-2, bbox_top-2, bbox_right+2, bbox_bottom+2, obj_flipblock, 0, 0);

//If there's a flip block in position
if (flip) 
&& (flip.object_index != obj_flipblock_big) {

    //Turn the flip block into another object
    with (flip) {
    
        //Get a random number
        other.int = choose(0, 1, 2, 3, 4, 5);
        
        //Get a random ite
        switch (other.int) {
            
            //Thwimp
            case (3): instance_create_depth(x+8, y, -2, obj_thwimp); break;
            
            //Coin
            case (4): {
            
                with (instance_create_depth(x+8, y, -2, obj_coinnpc))
                    xspeed = 0.5;                 
            } break;
            
            //1-Up
            case (5): {
            
                with (instance_create_depth(x+8, y, -2, obj_1up))
                    xspeed = 1;
            } break;
            
            //Default
            default:
                instance_create_depth(x+8, y, -2, obj_koopa_yellow); break;
        }
        
        //Destroy
        instance_destroy();
    }
    
    //Destroy this spell
    event_user(0);
}
