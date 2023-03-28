/// @description Render me

//Draw balloons
if (ready < 2) {

	draw_sprite_ext(spr_glider_balloons, balloons - 1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
}

//Draw ring
draw_sprite_ext(sprite_index, 0, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);