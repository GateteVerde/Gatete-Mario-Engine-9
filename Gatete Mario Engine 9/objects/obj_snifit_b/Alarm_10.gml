/// @description Move towards Mario

//Inherit the parent event
event_inherited();

//Stop
alarm[1] = 120;

//Move towards Mario
alarm[11] = 60;

//Animate the object
if (image_speed == 0)
	image_speed = 1;