/// @description Draw the cards

if (sprite_index == spr_cardgame_cards) {

	//Set frame
	var frame = (global.hp_mode) ? 6 : 0;
	
	//Draw
	if (mycard == 0)
		draw_sprite_ext(spr_cardgame_cards, frame, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
	else
		draw_sprite_ext(spr_cardgame_cards, mycard, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
}
else
	draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);