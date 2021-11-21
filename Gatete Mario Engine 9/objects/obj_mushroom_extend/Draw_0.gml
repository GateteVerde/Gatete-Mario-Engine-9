/// @description Render me

//Set up palette
pal_swap_set(spr_palette_mushroom_extend, pal);

//Width
var _width = sprite_width + boop_change;

//Middle
draw_sprite_ext(sprite_index, 3, x - (_width / 2) + 16, y, _width - 30, image_yscale, 0, c_white, 1);

//Corners
draw_sprite_ext(sprite_index, 1, x - (_width / 2) + 16, y, 1, image_yscale, 0, c_white, 1);
draw_sprite_ext(sprite_index, 2, x + (_width / 2) - 16, y, 1, image_yscale, 0, c_white, 1);

//Step
draw_sprite_ext(spr_mushroom_lift_stem, 1, xstart, y + 8, 1, room_height - y + 25, 0, c_white, 1);
draw_sprite_ext(spr_mushroom_lift_stem, 0, xstart, y, 1, 1, 0, c_white, 1);

//Reset palette
pal_swap_reset();