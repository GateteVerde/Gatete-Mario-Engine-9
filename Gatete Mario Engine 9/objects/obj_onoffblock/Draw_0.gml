/// @description Draw the block

draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
if (ready > 0) {

	draw_sprite_ext(sprite_index, 2, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
}