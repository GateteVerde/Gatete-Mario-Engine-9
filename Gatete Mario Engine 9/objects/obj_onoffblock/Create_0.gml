/// @description On/Off Block (Do not use Timed On/Off Blocks with these blocks)

//Inherit the parent event
event_inherited();

//Do not animate
image_speed = 0;

//Change frame if this is on or off
if (global.on_off_block == 0)
	image_index = 0;
else
	image_index = 1;