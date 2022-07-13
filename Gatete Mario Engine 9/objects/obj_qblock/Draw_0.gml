/// @description Draw the block

//If this block is hidden under a brick block
if (sprite_index == spr_brick) {
	
	//Set palette
	pal_swap_set(spr_palette_brick, obj_levelcontrol.level_palette)
	
	//Draw the block
	draw_sprite_ext(spr_brick, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
	
	//Reset palette
	pal_swap_reset();
}
	
//Otherwise
else {
	
	//If this is an area block, do not change
	if (sprite_index == spr_area_y)
		draw_sprite_ext(spr_area_y, 0, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
		
	//Otherwise, if this is a flip block, do not change
	else if (sprite_index == spr_flipblock)
		draw_sprite_ext(spr_flipblock, 0, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
	
	//Otherwise
	else {

		//Set palette
		pal_swap_set(spr_palette_block, obj_levelcontrol.level_palette);

		//Manage "?" mark position
		xx += 0.33;

		//Draw the block
		draw_sprite_ext(sprite_index, 0, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
		draw_sprite_tiled_area_ext(sprite_index, 1, screen_round(x) + xx, screen_round(y), x + 2, y + 2, x + 13, y + 14, c_white, 1);

		//Reset palette
		pal_swap_reset();
	}
}