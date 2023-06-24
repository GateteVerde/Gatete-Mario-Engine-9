/// @description Draw Mario

//Set up the palette
pal_swap_set_player(global.palette[global.player].main, global.palette[global.player].star);

//Draw Mario
if (sprite_index > -1) {
	
	draw_sprite_custom_origin(sprite_index, image_index, screen_round(x), screen_round(y)+1, sprite_get_xoffset(sprite_index), sprite_height, xscale, yscale, 0, image_blend, image_alpha);

}

//Reset the palette
pal_swap_reset();