/// @description Render

//Set up the palette
pal_swap_set_player(global.palette[global.player].main, global.palette[global.player].star, global.palette[global.player].mega);

//Render me
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y), image_xscale, 1, image_angle, c_white, alpha);

//Reset the palette
pal_swap_reset();