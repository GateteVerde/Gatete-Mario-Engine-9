/// @description Generate bubble

//Repeat the process
alarm[0] = 1+round(random(7));

//Create effect
with (instance_create_depth(x, bbox_top, -2, obj_twister_bubble))
    parent = other.id;
