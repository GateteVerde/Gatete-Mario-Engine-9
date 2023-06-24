/// @description Draw Mario

//Set the palette
pal_swap_set_player(global.palette[global.player].main, global.palette[global.player].star);

//Draw the player
draw_sprite_ext(global.ride_sprite[global.powerup], f, screen_round(x), screen_round(y)+1+myy, obj_mario.xscale, 1, 0, c_white, obj_mario.image_alpha);

//Reset palette
pal_swap_reset();