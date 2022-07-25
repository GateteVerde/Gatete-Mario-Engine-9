/// @description Reznor room ground

//Create solid platform
mysolid = instance_create_depth(x, y, 0, obj_solid);

//Count how many reznors are in room
count = 0;

//Whether the ground is collapsing
ready = 0;

//Do not animate
image_speed = 0;