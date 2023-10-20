/// @description Render fire

draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);

//Draw a muncher
if (muncher == 1) {
	
	draw_sprite_ext(spr_muncher_fire, m, screen_round(x), screen_round(y), image_xscale, image_yscale, image_angle, c_white, 1);
}