/// @description Render card

//Box
draw_sprite_ext(spr_goal_box, 0, screen_round(xstart), screen_round(ystart), 1, 1, 0, c_white, image_alpha);

//Card
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);