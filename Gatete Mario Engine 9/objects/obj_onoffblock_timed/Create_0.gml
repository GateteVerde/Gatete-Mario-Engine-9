/// @description Timed On/Off Block (Do not use normal On/Off Blocks with these blocks)

//Inherit the parent event
event_inherited();

//Do not animate
image_speed = 0;
image_index = 0;

//Change
alarm[11] = 60;

//Change frame if this is on or off
if (global.on_off_block == 0)
	sprite_index = spr_onoffblock_timed_r;
else
	sprite_index = spr_onoffblock_timed_b;