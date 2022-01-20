/// @description Render me

//If there's a path at the top
if (!collision_point(x - 8, y + 7, obj_path_bridge, 1, 0))
	draw_sprite_ext(sprite_index, 1, screen_round(x), screen_round(y) + 3, 1, 1, 0, c_white, image_alpha);
	
//Otherwise, if there's a path at the bottom
else if (!collision_point(x + 24, y + 7, obj_path_bridge, 1, 0))
	draw_sprite_ext(sprite_index, 2, screen_round(x), screen_round(y) + 3, 1, 1, 0, c_white, image_alpha);

//Otherwise, if there's a path at the top and the bottom
else if (collision_point(x - 8, y + 7, obj_path_bridge, 1, 0))
&& (collision_point(x + 24, y + 7, obj_path_bridge, 1, 0))
	draw_sprite_ext(sprite_index, 0, screen_round(x), screen_round(y) + 3, 1, 1, 0, c_white, image_alpha);