/// @description Render me

//Reduce xx
if (xx > 0) xx -= 4;

//Mario
draw_sprite_ext(sprite_index, global.player, screen_round(x), screen_round(y) - 1, 1, 1, 0, c_white, 1);

//Game + Over text
draw_sprite_ext(sprite_index, 2, screen_round(x) - (xx + 2), screen_round(global.gh / 2) - 8, 1, 1, 0, c_white, 1);
draw_sprite_ext(sprite_index, 3, screen_round(x) + xx, screen_round(global.gh / 2) - 8, 1, 1, 0, c_white, 1);