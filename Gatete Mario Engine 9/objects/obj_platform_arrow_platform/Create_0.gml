/// @description Moving Platform Parent

//Makes the object fully solid
issolid = true;

//Makes the object not carry Mario or NPCs horizontally
no_horiz = false;

//Default value
type = 0;

//Do not animate
image_speed = 0;

//Direction
dir = 0;

//Whether the player is not in the platform
ready = 0;

//Depth
depth = -2;

//Start blinking...
alarm[0] = 1380;

//...and destroy it.
alarm[1] = 1500;

//Start moving inmediately
alarm[3] = 1;