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
    && (t) 
	&& (b) 
	&& (l)
	&& (r) {
        
        //Do not allow creation of blocks.
        ready = 1;
		
		//Allow it later
        alarm[0] = 4;
        
        //Snap in grid
        move_snap(16, 16);
        
        //Create a killer block
        instance_create_depth(x, y, depth, obj_blocktrain_killer);   
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