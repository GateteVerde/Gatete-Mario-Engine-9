/// @description Green Area Block

/*
//	This object uses creation code
//
//	sprout = Use macro list
*/

//Default value
sprout = cs_coin;

//If the green switch has been pressed, turn into a real block
if (global.palace_g == 1) {
	
	alarm[0] = 1;
	exit;
}

//Do not animate
image_speed = 0;
image_index = 1;