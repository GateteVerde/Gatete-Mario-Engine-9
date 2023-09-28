/// @description Block train logic

//Boundaries
var t = collision_point(x + sprite_width / 2, bbox_top, obj_blocktrain_middle, 0, 0);
var b = collision_point(x + sprite_width / 2, bbox_bottom, obj_blocktrain_middle, 0, 0);
var l = collision_point(bbox_left, y + sprite_height / 2, obj_blocktrain_middle, 0, 0);
var r = collision_point(bbox_right, y + sprite_height / 2, obj_blocktrain_middle, 0, 0);

//If moving
if (speed > 0) {

    //If snapped on grid and it's allowed to create new blocks.
    if (ready == 0)
    && (!t) 
	&& (!b) 
	&& (!l)
	&& (!r) {
    
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
        
        //Create a new block
        instance_create_depth(x, y, depth + 1, obj_blocktrain_middle);
		
		//Snap into grid
		move_snap(16, 16);
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