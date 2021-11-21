/// @description Draw Mario

//Draw screen that got frozen
freeze_render();

//Draw Mario
if (sequence != 5)
&& (sequence != 6)
	draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, direct, image_yscale, 0, c_white, 1);
else {
	
	if (sequence == 5)
		draw_sprite_custom_origin(sprite_index, -1, screen_round(x), screen_round(y)+1, 16, 32, scale*direct, scale, 0, c_white, 1);
	else
		draw_sprite_custom_origin(sprite_index, -1, screen_round(x), screen_round(y)+1, sprite_get_xoffset(sprite_index), 32, scale*direct, scale, 0, c_white, 1);
}