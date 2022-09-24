/// @description Manage alpha

//Decrement show saved
show_saved -= 0.025;

//Update x offset
offset_x += 0.5;

//Update anim
anim += 0.15;

//If Mario exists
if (instance_exists(obj_mapmario)) {

	//If the inventory is not opened
	if (obj_mapmario.inventory == 0) {
		
		//Set inventory offset
		inv_offset_y = lerp(inv_offset_y, 0, 0.2);
		
		//Set y offset
		offset_y = lerp(offset_y, 0, 0.2);
	}
	
	//Otherwise, if the inventory is opened
	else if (obj_mapmario.inventory == 1) {
		
		//Set inventory offset
		inv_offset_y = lerp(inv_offset_y, global.gh / 2 - 51, 0.2);
		
		//Set y offset
		offset_y = lerp(offset_y, 32, 0.2);
	}
}

//Update flashing
if (global.mapstar == 1) {

	isflashing += 0.25;
	if (isflashing > 3.99)
		isflashing = 0;
}
else
	isflashing = 0;