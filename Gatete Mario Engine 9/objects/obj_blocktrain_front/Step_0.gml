/// @description Block train logic

//If moving
if (speed > 0) {

    //If snapped on grid and it's allowed to create new blocks.
    if (ready == 0)
    && (place_snapped(16, 16)) {
    
        //Check length
        if (length > 0) {
        
            //If there's one block left to create.
            if (length == 1) {
            
                //Do not create more blocks
                length = 0;
                
                //Create block train back block
                myback = instance_create_depth(xstart, ystart, depth, obj_blocktrain_back);
                with (myback) {
                
                    //Remember up this block.
                    parent = other.id;
                    
                    //Make it move in the speed of this block
                    speed = other.speed;
                    
                    //Make it move in the direction of this block.
                    direction = other.dir;
                }
            }
            
            //Decrement length.
            else
                length--;
        }
        
        //Do not allow creation of blocks.
        ready = 1;
        
        //Allow it later
        alarm[0] = 4;
        
        //Snap in grid
        move_snap(16,16);
        
        //Create a new block
        instance_create_depth(x, y, depth + 1, obj_blocktrain_middle);   
    }
}

//Set up direction
if ((collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_up, 0, 0)) && (direction != 90))
	{ direction = 90; move_snap(16, 16) }
else if ((collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_down, 0, 0)) && (direction != 270))
	{ direction = 270; move_snap(16, 16) }
else if ((collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_left, 0, 0)) && (direction != 180))
	{ direction = 180; move_snap(16, 16) }
else if ((collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_right, 0, 0)) && (direction != 0))
	{ direction = 0; move_snap(16, 16) }