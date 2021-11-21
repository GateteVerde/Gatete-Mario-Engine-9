/// @description Blue Flipper logic

//If the ON/OFF switch is on, do not allow the flippers to open
if (global.on_off_block == 0) {

	//If the gate is opened
	if ((image_index > -1) && (image_index < 3)) {
		
		//First, check if there's not a player overlapping
		if (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_mario, 0, 0))
		&& (!collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_physicsparent, 0, 0)) {
	
			image_index--;
			if (image_index == 0) {
		
				//Visually close it
				image_index = 3;
			
				//Ready to open
				ready = 0;
			
				//Make solid stay at start position
				with (mysolid) {
			
					x = xstart;
					y = ystart;
				}
			}
		}
	}
}

//Otherwise, inherit the parent event
else
	event_inherited();