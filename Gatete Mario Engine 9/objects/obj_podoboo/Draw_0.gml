/// @description Render me

//If this object uses any of the following sprites, apply palette
if (sprite_index == spr_podoboo_alt) {
	
	//Set palette
	pal_swap_set(spr_palette_lava, obj_levelcontrol.lava_palette);
}

//Render
draw_sprite_custom_origin(sprite_index, -1, screen_round(x) + offset, screen_round(y), 8, 8, xscale, yscale, 0, c_white, 1);

//Reset palette
pal_swap_reset();