/// @description Render me

//If not charging
if (charge == 0)
	draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), xscale, 1, 0, c_white, 1);
	
//Otherwise, if charging
else {

	if (charge == 1) {
		
		//Draw NPC
		draw_sprite_ext(spr_stingby_mad, -1, screen_round(x), screen_round(y), xscale, 1, 0, c_white, 1);
		
		//Draw Alert
		draw_sprite_ext(spr_enemy_alert, -1, screen_round(x), screen_round(bbox_top) - 20, xscale, 1, 0, c_white, 1);
	}
	else
		draw_sprite_custom_origin(spr_stingby_mad, -1, screen_round(x), screen_round(y), 12, 10, xscale, 1, -15 * xscale, c_white, 1);
}
