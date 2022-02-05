/// @description Render me

//If the bubble does not hold a star coin
if (sprout != 3)
	draw_sprite_ext(spr_solidbubble_item, sprout, screen_round(x), screen_round(y) + offset, 1, 1, 0, c_white, 1);
	
//Otherwise
else {

	//If this coin has not been collected yet
	if (ds_map_find_value(global.sc[sc_type], global.level) <> 1) {
		
		if (ds_map_find_value(global.sc[sc_type], global.level) == 3)
			draw_sprite_ext(spr_solidbubble_starcoin, 1, screen_round(x), screen_round(y), scale, scale, 0, c_white, 0.5);
		else
			draw_sprite_ext(spr_solidbubble_starcoin, 0, screen_round(x), screen_round(y), scale, scale, 0, c_white, 1);
	}
}

//Draw bubble
draw_sprite_ext(spr_solidbubble, 0, screen_round(x), screen_round(y), scale, scale, 0, c_white, 1);