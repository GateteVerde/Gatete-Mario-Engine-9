/// @description Generate bubble

//Repeat the process
alarm[1] = 4;

//If blowing
if (sprite_index == spr_ptooie_blow) {
    
    //Create effect
    with (instance_create_depth(x, bbox_top-4, 0, obj_ptooie_bubble))
        parent = other.id;
}
