/// @description Draw the block

//Set palette
pal_swap_set(spr_palette_block, obj_levelcontrol.level_palette);

//Manage "?" mark position
xx += 0.66;

//Draw the block
draw_sprite_ext(sprite_index, 0, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
draw_sprite_tiled_area_ext(sprite_index, 1, screen_round(x) + xx, screen_round(y), x + 4, y + 4, x + 27, y + 27, c_white, 1);

//Reset palette
pal_swap_reset();