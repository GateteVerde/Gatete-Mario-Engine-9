/// @description Render me

//If this object uses any of the following sprites, apply palette
if (sprite_index == spr_podoboo_alt_trail)
|| (sprite_index == spr_splash_lava)
|| (sprite_index == spr_splash_lava_ceiling) {
	
	//Set palette
	pal_swap_set(spr_palette_lava, obj_levelcontrol.lava_palette);
}

//Render me
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), image_xscale, image_yscale, 0, c_white, image_alpha);

//Reset palette
pal_swap_reset();