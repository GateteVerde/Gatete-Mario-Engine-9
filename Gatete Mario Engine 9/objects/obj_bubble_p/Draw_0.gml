/// @description Render Bubble

//If this bubble captured a enemy, draw a coin inside
if (capture > 0) {

	if (capture == 2)
		draw_sprite_ext(spr_coin_npc, image_index, screen_round(x), screen_round(y - 4), 1, 1, 0, c_white, 1);
	else
		draw_sprite_ext(enemy_spr, 0, round(bbox_left + bbox_right) / 2, round(bbox_top + bbox_bottom) / 2, enemy_scale, enemy_scale, enemy_angle, c_white, 1);
}

//Draw the bubble
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y + 1), scale, scale, image_angle, image_blend, image_alpha);