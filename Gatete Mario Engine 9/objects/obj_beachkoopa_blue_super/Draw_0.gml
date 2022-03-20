/// @description Render me

//Set palette
pal_swap_set(spr_palette_beachkoopa_cape, isflashing);

//Draw NPC
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y + 1), xscale, yscale, image_angle, image_blend, image_alpha);

//Reset palette
pal_swap_reset();