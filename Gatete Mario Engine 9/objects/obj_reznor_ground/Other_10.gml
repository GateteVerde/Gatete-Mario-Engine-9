/// @description Reveal bridge again

//Make the bridge visible
visible = 1;

//Deny alarm 0
alarm[0] = -1;

//Return solid to normal spot
with (mysolid) {

	x = xstart;
	y = ystart;
}

//Create a smoke effect
instance_create_depth(x+8, y+8, -6, obj_smoke);