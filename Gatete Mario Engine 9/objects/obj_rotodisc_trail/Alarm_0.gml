/// @description Increment frame

//Repeat
alarm[0] = 4;

//Change frame and destroy.
if (image_index < 2)
    image_index++;
else
    instance_destroy();