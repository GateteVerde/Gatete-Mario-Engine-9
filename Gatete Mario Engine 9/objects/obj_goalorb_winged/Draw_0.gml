/// @description Render me

//Set wing animation
anim += (yspeed > 0) ? 0.15 : 0.3;

//Wings
draw_sprite_ext(spr_qblock_winged, anim, screen_round(x)-8, screen_round(y)+1, 1, 1, 0, c_white, image_alpha);

//Orb
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y)+1, 1, 1, 0, c_white, image_alpha);