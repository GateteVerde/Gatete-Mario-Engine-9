/// @description Render me

//Set palette
pal_swap_set(spr_palette_block_empty, obj_levelcontrol.level_palette);

//Draw the block
draw_sprite_ext(sprite_index, semisolid, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);

//Reset palette
pal_swap_reset();