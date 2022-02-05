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
image_alpha = 0;

//Check map value
if (ds_map_find_value(global.worldmap, id) > 0) {

	image_alpha = 1;
	if (ds_map_find_value(global.worldmap, id) == 2) {

		//Set the sprite
		sprite_index = spr_levelpanel_beaten;
		image_speed = 0;
		image_index = 3;
		
		//Mark as beaten
		beaten = 1;
	}
}

//Otherwise
else {
	
	if (secretexit != noone)
		sprite_index = spr_levelpanel_red;
	else
		sprite_index = spr_levelpanel;
}