/// @description Render me

//Render pit
draw_sprite_ext(sprite_index, 0, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);

//Set colour
draw_set_colour(c_black);

//Set alpha
draw_set_alpha(0.5);

//Render rectangle
draw_rectangle(x, y, x + 32, y + 15, false);

//Reset alpha
draw_set_alpha(1);

//Reset colour
draw_set_colour(c_white);
