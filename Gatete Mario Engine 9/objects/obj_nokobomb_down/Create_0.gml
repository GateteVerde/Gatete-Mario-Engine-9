/// @description Stunned Nokobomb

//Inherit the parent event
event_inherited();

//Do not animate
image_speed = 0;
image_index = 0;

//Blink
alarm[0] = 240;

//Destroy
alarm[1] = 300;