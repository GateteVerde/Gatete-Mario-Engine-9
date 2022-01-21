/// @description Fort Level Panel

//Create a node
with (instance_create_layer(x, y, "Main", obj_node)) visible = false;

//Do not animate
image_speed = 0;

//Checkpoint
checkpoint = noone;
alarm[0] = 1;

//Ready
ready = 0;

//Was the level beaten
beaten = 0;

//Panel type
paneltype = 1;

//Alpha
image_alpha = 1;

//Check map value
if (ds_map_find_value(global.worldmap, id) == 2) {

	//Set the sprite
	image_index = 1;
		
	//Mark as beaten
	beaten = 1;
}