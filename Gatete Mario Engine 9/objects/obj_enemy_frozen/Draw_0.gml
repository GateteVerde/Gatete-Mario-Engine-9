/// @description Render NPC

//Draw NPC
draw_sprite_ext(sprite_index, image_index, screen_round(x)+offset, screen_round(y)+1, xscale, yscale, image_angle, c_aqua, image_alpha);

//Draw Ice Block
draw_sprite_stretched_ext(spr_enemy_ice, 0, screen_round(bbox_left)+offset, screen_round(bbox_top) + 1, sprite_width, sprite_height, c_white, image_alpha);