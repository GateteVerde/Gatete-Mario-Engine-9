/// @description Render me

//Panel
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, image_alpha);

//Draw number if not beaten
if (sprite_index != spr_levelpanel_beaten)
&& (sprite_index != spr_levelpanel_red_beaten)
	draw_sprite_ext(spr_levelpanel_numbers, levelnumb - 1, screen_round(x) + 8, screen_round(y) + 8, 1, 1, 0, c_white, image_alpha);