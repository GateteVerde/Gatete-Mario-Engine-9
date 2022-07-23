/// @description Render me

//Animate fuse
anim += 0.5;

//Set palette
pal_swap_set(spr_palette_kabomb, round(pal));

//Render me
draw_sprite_ext(sprite_index, -1, screen_round(x) + xoffset, screen_round(y) + 1 + yoffset, xscale, 1, 0, c_white, 1);

//Reset palette
pal_swap_reset();

//Fuse
if (charge > 0) {
	
	if (charge >= 2)
		draw_sprite_ext(spr_fuse, anim, screen_round(x) + xoffset, screen_round(y) - 2 + yoffset, 1, 1, 0, c_white, 1);
	else
		draw_sprite_ext(spr_fuse, anim, screen_round(x) - 4 * xscale, screen_round(y) - 2 + image_index, 1, 1, 0, c_white, 1);
}