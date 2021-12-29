/// @description Render me

//Update frame
frame += 0.2;

//Draw it
draw_sprite(sprite_index, image_index, screen_round(x), screen_round(y));
draw_sprite_ext(spr_fireball, frame, screen_round(x)+8, screen_round(y)+4, 1, 1, 0, c_white, 1);