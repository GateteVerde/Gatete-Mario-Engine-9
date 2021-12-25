/// @description Cycle between frames

//If not bumped
if (ready == 0) {

	image_index++;
	if (image_index > 9)
		image_index = 0;
}

//Set alarm
alarm[2] = 9;