/// @description Render me

var direct = (speed = 0) ? save_dir : direction;

//If not turning
if (turn == 0)
	draw_sprite_custom_origin(sprite_index, -1, screen_round(x), screen_round(y), 8, 8, xscale, 1, direct, c_white, 1);

//Otherwise, if turning
else {

	if ((turn == 1) || (turn == -1))
		draw_sprite_custom_origin(sprite_index, -1, screen_round(x), screen_round(y), 8, 8, xscale, 1, direct - 45, c_white, 1);
	else if ((turn == 2) || (turn == -2))
		draw_sprite_custom_origin(sprite_index, -1, screen_round(x), screen_round(y), 8, 8, xscale, 1, direct + 45, c_white, 1);
}
