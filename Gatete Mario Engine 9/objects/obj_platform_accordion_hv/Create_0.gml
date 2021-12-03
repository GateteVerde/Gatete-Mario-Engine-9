/// @description Horizontal Accordion Block

//Inherit the parent event
event_inherited();

//Do not animate
image_speed = 0;
image_index = 0;

//Expand
alarm[0] = 90;

//Create blocks
llb = instance_create_depth(x, y, -2, obj_accordion_block);
lrb = instance_create_depth(x, y, -1, obj_accordion_block);
rlb = instance_create_depth(x, y, -1, obj_accordion_block);
rrb = instance_create_depth(x, y, -2, obj_accordion_block);