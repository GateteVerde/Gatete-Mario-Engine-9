/// @description Render me

//Set palette
pal_swap_set(spr_palette_bobomb, pal);

//Render me
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y + 1), xscale, 1, image_angle, image_blend, image_alpha);

//Reset palette
pal_swap_reset();
