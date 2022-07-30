/// @description Reznor room ground

//Create solid platform
mysolid = instance_create_depth(x, y, 0, obj_solid);

//Whether the ground is collapsing
ready = 0;

//How many Reznors are in room
reznors = 0;
alarm[1] = 4;

//Do not animate
image_speed = 0;

//Set depth
depth = 200;