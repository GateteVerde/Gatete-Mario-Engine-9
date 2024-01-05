/// @description Directional Accordion Block

//Inherit the parent event
event_inherited();

//Makes the object fully solid
issolid = true;

//Do not animate
image_speed = 0;
image_index = 0;

//Expand
alarm[0] = 90;

//Create blocks
block1 = instance_create_depth(x, y, 1, obj_accordion_block);
block2 = instance_create_depth(x, y, 2, obj_accordion_block);
block3 = instance_create_depth(x, y, 3, obj_accordion_block);
block4 = instance_create_depth(x, y, 4, obj_accordion_block);