/// @description Draw the shell

draw_sprite_custom_origin(sprite_index, -1, screen_round(x), screen_round(y) + 1, sprite_width / 2, sprite_height / 2, 1, 1, 180 * flip, c_white, 1);
if (koopainside > 0) {

	draw_sprite_custom_origin(spr_shell_eyes_spin, -1, screen_round(x), screen_round(y) + 1, sprite_width / 2, sprite_height / 2, 1, 1, 180 * flip, c_white, 1);
}