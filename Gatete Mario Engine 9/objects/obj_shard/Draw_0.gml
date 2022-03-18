/// @description Render shard

//If this shard is from a brick
if (sprite_index == spr_shard_brick) 
|| (sprite_index == spr_shard_big_brick) {

	//Set palette
	pal_swap_set(spr_palette_brick, obj_levelcontrol.level_palette);

	//Draw the block
	draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);

	//Reset palette
	pal_swap_reset();	
}

//Otherwise, if this shard is from a empty block
else if (sprite_index == spr_shard_empty) 
|| (sprite_index == spr_shard_big_empty) {

	//Set palette
	pal_swap_set(spr_palette_block_empty, obj_levelcontrol.level_palette);

	//Draw the block
	draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);

	//Reset palette
	pal_swap_reset();	
}

//Otherwise
else {

	//If this shard is a yellow area one
	if (sprite_index == spr_shard_area_y)
		draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
	
	//Otherwise
	else {

		//Set palette
		pal_swap_set(spr_palette_block, obj_levelcontrol.level_palette);

		//Draw the block
		draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);

		//Reset palette
		pal_swap_reset();	
	}
}
