/// @description Manage alpha

//Update x offset
offset_x += 0.5;

//If Mario exists
if (instance_exists(obj_mapmario)) {

	//If the inventory is not opened
	if (obj_mapmario.inventory == 0) {
		
		//Set inventory offset and alpha
		inv_offset_y = lerp(inv_offset_y, 0, 0.2);
		inv_alpha = lerp(inv_alpha, 0, 0.2);
		
		//Set y offset
		offset_y = lerp(offset_y, 0, 0.2);
		
		//Reset prompt
		prompt = 0;
	
		//Increase alpha
		image_alpha += 0.1;
		if (image_alpha > 1)
			image_alpha = 1;
	}
	
	//Otherwise, if the inventory is opened
	else if (obj_mapmario.inventory == 1) {
		
		//Set inventory offset and alpha
		inv_offset_y = lerp(inv_offset_y, global.gh / 2 + 40, 0.2);
		inv_alpha = lerp(inv_alpha, 0.5, 0.2);
		
		//Set y offset
		offset_y = lerp(offset_y, 32, 0.2);
	
		//Decrease alpha
		image_alpha -= 0.1;
		if (image_alpha < 0)
			image_alpha = 0;
	}
}
