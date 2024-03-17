/// @description Render me

//Set palette
pal_swap_set(spr_palette_brick, obj_levelcontrol.level_palette);

// Get real image speed
var _image_speed = (sprite_get_speed_type(sprite_index) == spritespeed_framespersecond) ?
	(sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) : image_speed;
	
//Draw the block
draw_sprite_ext(sprite_index, _image_speed * obj_levelcontrol.tick, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);

//Reset palette
pal_swap_reset();