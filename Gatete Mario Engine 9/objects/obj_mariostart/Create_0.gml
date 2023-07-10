/// @description Display "Mario Start!" at the beginning of the level

//Do not animate
image_speed = 0;
image_index = 1 + global.player;

//Set depth
depth = -100;

//Deactivate
alarm[0] = 1;