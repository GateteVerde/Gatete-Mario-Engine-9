/// @description Blue Area Block

//If the blue switch has been pressed, turn into a real block
if (global.palace_b == 1) {
	
	alarm[0] = 1;
	exit;
}

//Do not animate
image_speed = 0;
image_index = 1;