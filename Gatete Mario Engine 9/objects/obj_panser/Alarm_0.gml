/// @description Change frame

//Repeat
alarm[0] = 6;

//Swap frame
if (image_index == 0)
	image_index = 1;
else if (image_index == 1)
	image_index = 0;