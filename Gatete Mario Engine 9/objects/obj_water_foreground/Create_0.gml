/// @description Foreground water

/*
//	This object uses creation code
//
//	push = Pick from below
//		0: Do not push Mario
//		1: Push Mario to the right
//	   -1: Push Mario to the left
*/

//Default variables
push = 0;
xx = 0;

//Set depth
depth = -7;

//Alpha
alpha = 1;
alphaval = alpha/100;

//Manage tide movement
alarm[0] = 360;

//Generate bubble effects
alarm[1] = 7;

//Create a water surface
water = instance_create_layer(x, y+4, "Main", obj_swim);
with (water) {

    image_xscale = room_width / 16;
    image_yscale = room_height / 16;
}