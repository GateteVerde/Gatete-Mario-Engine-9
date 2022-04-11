/// @description Buster Beetle logic

//Inherit the parent event
event_inherited();

//If the brick does not exist
if (mybrick == -1) {

    //If there's a blue brick at the left
    if ((xscale == -1) && (collision_rectangle(bbox_left-3, bbox_top, bbox_left, bbox_bottom-1, obj_brick_blue, 0, 0)))
    || ((xscale == 1) && (collision_rectangle(bbox_right, bbox_top, bbox_right+3, bbox_bottom-1, obj_brick_blue, 0, 0))) {
    
        //Create a brick
        mybrick = instance_create_depth(x+16*xscale, y+2, -2, obj_busterbeetle_pickup);
        
        //With the created brick
        with (mybrick) {
            
            //Set up the parent
            parent = other.id;
            
            //Set the picking direction
            if (other.xscale < 0)
                hspeed = 1;
            else if (other.xscale > 0)
                hspeed = -1;            
        }
        
        //Stop horizontal speed
        xspeed = 0;
        
        //Set the holding sprite
        sprite_index = spr_busterbeetle_hold;        
    }
}

//Face towards direction
if (xspeed > 0)
    xscale = 1;
else if (xspeed < 0)
	xscale = -1;
