/// @description Render me

//Draw the stem
draw_sprite_ext(spr_mushroom_lift_stem, 1, screen_round(bbox_left + bbox_right) / 2, y + 25, 1, room_height - y + 25, 0, c_white, 1);
draw_sprite_ext(spr_mushroom_lift_stem, 0, screen_round(bbox_left + bbox_right) / 2, y + 24, 1, 1, 0, c_white, 1);

//Draw cap
draw_self();