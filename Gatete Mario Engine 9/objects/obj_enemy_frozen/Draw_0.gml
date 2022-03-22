/// @description Render NPC

//Draw NPC
draw_sprite_ext(sprite_index, 0, screen_round(x)+offset, screen_round(y)+1, xscale, yscale, image_angle, c_white, image_alpha);

//Draw Ice Block
draw_sprite_ext(spr_enemy_ice, anim_b, screen_round(x)+offset, screen_round(y)+1, 1, 1, image_angle, c_white, 1);