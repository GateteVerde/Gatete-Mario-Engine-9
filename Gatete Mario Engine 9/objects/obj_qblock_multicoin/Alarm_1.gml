/// @description Finish block bump

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Turn into a used block
if (scatter == 0) {

	if (coiny == 2) {
	
		//If this block can sprout a mushroom
		if (hits >= 10)
		&& (mushroom == true) {
	
			//Sprout out a mushroom
			with (instance_create_depth(x+8, y, 10, obj_powerup_sprout))
				sprite_index = spr_mushroom;
		}
	
		//Turn into a used block
		instance_change(obj_emptyblock, false);
	}
	else
		ready = 0;
}
else
	instance_change(obj_emptyblock, false);