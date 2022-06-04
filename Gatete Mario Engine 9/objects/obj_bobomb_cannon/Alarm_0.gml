/// @description Blink

//Do not animate
image_speed = 0;
image_index = 0;

//Stop horizontal movement
xspeed = 0;

//Repeat
alarm[0] = 2;

//Increment palette
pal++;
if (pal > 2)
	pal = 0;
