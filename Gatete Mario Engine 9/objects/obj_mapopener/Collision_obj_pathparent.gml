/// @description Make the path visible

with (other) {
	
	//If not visible
	if (image_alpha == 0) {
		
		//Make it visible
		image_alpha = 1;
		
		//Remember it
		ds_map_replace(global.worldmap, id, 1);
	}
}