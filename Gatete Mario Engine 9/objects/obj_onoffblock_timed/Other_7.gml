/// @description Resume block function

//Set up sprite
sprite_index = (global.on_off_block == 0) ? spr_onoffblock_timed_r : spr_onoffblock_timed_b;

//Do not animate
image_speed = 0;
image_index = 0;

//Change number
alarm[11] = 60;