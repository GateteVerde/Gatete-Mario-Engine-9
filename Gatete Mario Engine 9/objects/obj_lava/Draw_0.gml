/// @description Render me

//Draw lava
draw_sprite_ext(sprite_index, anim, screen_round(x), screen_round(y), image_xscale, image_yscale, image_angle, c_white, 1);

//Manage animation
anim += 0.15;
if (anim > 3.99)
	anim = 1;