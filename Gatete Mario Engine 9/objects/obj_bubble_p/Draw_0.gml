/// @description Render Bubble

//If this bubble captured a enemy, draw a coin inside
if (capture == 1) {

	draw_sprite_ext(spr_coin_npc, image_index, screen_round(x), screen_round(y - 4), 1, 1, 0, c_white, 1);
}

draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y + 1), scale, scale, image_angle, image_blend, image_alpha);