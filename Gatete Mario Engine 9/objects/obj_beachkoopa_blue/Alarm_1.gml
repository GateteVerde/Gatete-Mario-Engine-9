/// @description Generate a effect

//If it is moving first of all
if (xspeed <> 0) {
	
    //If sliding or kicking
    if (slide) 
	|| (kicky > 1) {
		
        with (instance_create_depth(x-8*xscale, bbox_bottom, -4, obj_smoke))
            sprite_index = spr_smoke_c;
	}
}

//Repeat the process
alarm[1] = 8;