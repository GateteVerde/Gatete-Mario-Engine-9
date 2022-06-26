/// @description Render me

#region RENDER ENEMY

	//If the bubble holds a mushroom
	if (sprout == spr_mushroom)
		draw_sprite_ext(spr_mushroom, image_index, screen_round(x)+8+(sprite_get_xoffset(sprout)), screen_round(y)+10, xscale, 1, 0, c_white, 1);
		
	//Otherwise
	else {
		
		draw_sprite_ext(sprout, image_index, screen_round(x)+8+(sprite_get_xoffset(sprout)), screen_round(y)+26, xscale, -1, 0, c_white, 1);
	}
#endregion

//Draw bubble
draw_sprite_ext(sprite_index, image_index, screen_round(x), y, 1, 1, 0, c_white, image_alpha);
