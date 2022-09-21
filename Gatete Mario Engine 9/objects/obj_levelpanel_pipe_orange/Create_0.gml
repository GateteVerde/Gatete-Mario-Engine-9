/// @description Level Panel

//Create a node
with (instance_create_layer(x, y, "Main", obj_node)) visible = false;

//Checkpoint
checkpoint = noone;
alarm[0] = 1;

//Ready
ready = 0;

//Was the level beaten
beaten = 0;

//Panel type
paneltype = 0;

//Alpha
image_alpha = 1;