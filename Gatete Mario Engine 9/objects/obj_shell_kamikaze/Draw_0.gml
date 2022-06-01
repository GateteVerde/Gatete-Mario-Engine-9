/// @description Render me

//Set palette
pal_swap_set(spr_palette_shell_kamikaze, pal);

//Draw NPC
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y + 1), xscale, yscale, image_angle, image_blend, image_alpha);
draw_sprite_custom_origin(spr_shell_eyes_spin, anim, screen_round(x), screen_round(y) + 1, sprite_width / 2, sprite_height / 2, 1, 1, 0, c_white, 1);

//Reset palette
pal_swap_reset();