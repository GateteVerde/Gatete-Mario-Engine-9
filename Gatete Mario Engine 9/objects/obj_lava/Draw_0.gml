/// @description Render me

//Set palette
pal_swap_set(spr_palette_lava, obj_levelcontrol.lava_palette);

//Draw lava
draw_sprite_ext(sprite_index, anim, screen_round(x), screen_round(y), image_xscale, image_yscale, image_angle, c_white, 1);

//Reset palette
pal_swap_reset();

//Manage animation
anim += 0.15;
if (anim > 3.99)
	anim = 1;