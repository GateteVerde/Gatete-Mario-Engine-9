/// @description Render me

//Draw front wing
draw_sprite_ext(spr_galoomba_wing_back, anim, screen_round(x), screen_round(y) + 1 + floor(image_index), xscale, yscale, image_angle, image_blend, image_alpha);

//Draw Galoomba
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y) + 1, xscale, yscale, image_angle, image_blend, image_alpha);

//Draw back wing
draw_sprite_ext(spr_galoomba_wing_front, anim, screen_round(x), screen_round(y) + 1 + floor(image_index), xscale, yscale, image_angle, image_blend, image_alpha);