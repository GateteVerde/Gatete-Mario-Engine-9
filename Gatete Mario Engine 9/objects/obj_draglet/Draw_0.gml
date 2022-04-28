/// @description Render me

//Body
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), xscale, 1, 0, c_white, 1);

//Wing
draw_sprite_ext(spr_draglet_wing, anim, screen_round(x) + round(image_index) * xscale*-1, screen_round(y) + round(image_index), xscale, 1, 0, c_white, 1);
