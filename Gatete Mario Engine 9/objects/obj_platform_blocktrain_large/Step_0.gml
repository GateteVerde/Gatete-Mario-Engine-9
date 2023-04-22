/// @description Create Large Block Train

if (collision_rectangle(bbox_left, bbox_top-5, bbox_right, bbox_top+4, obj_mario, 0, 0))
&& (obj_mario.bbox_bottom < yprevious+5) 
&& (obj_mario.state != playerstate.jump) {
        
    //Create train
    with (instance_create_depth(xstart, ystart, depth, obj_blocktrain_front)) {

		sprite_index = spr_platform_blocktrain_large;
        dir = 0;
        motion_set(0, other.spd);
        length = other.length-1;
    }
    
    //Destroy
    instance_destroy();
}