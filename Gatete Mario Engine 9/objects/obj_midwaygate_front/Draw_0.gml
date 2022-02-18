/// @description Render me

draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, image_yscale, 0, c_white, 1);
if (position_meeting(x, bbox_bottom+1, obj_semisolid))
	draw_sprite(spr_midwaygate_b_fix, -1, screen_round(x), screen_round(bbox_bottom)-15);