/// @description Make path visible

//If the path is not visible
if (image_alpha == 0) {
	
	//Make it visible
	image_alpha = 1;
	
	//Remember it
	if (ds_map_find_value(global.worldmap, id) == 0)
		ds_map_replace(global.worldmap, id, 1);
}