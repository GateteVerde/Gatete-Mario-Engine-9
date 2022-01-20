/// @description Render me

//Check for paths
var pathH = collision_point(x - 8, y + 7, obj_pathparent, 0, 0);
var pathV = collision_point(x + 7, y - 8, obj_pathparent, 0, 0);

//If the path is not in water
if (in_water == 0) {
	
	//If there's a path to the left
	if (pathH) 
	&& (pathH.image_alpha == 1) {
	
		draw_sprite_part_ext(spr_path_h, 1, 0, 0, 16, 16, screen_round(x), screen_round(y), 1, 1, c_white, image_alpha);
	}
	
	//If there's a path at the top
	if (pathV) 
	&& (pathV.image_alpha == 1) {
	
		draw_sprite_part_ext(spr_path_v, 1, 0, 0, 16, 16, screen_round(x), screen_round(y), 1, 1, c_white, image_alpha);
	}
	
	//Draw node
	draw_sprite_ext(spr_path_node_a, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, image_alpha);
}
else {
	
	//If there's a path to the left
	if (pathH) 
	&& (pathH.image_alpha == 1) {
	
		draw_sprite_part_ext(spr_path_h, 2, 0, 0, 16, 16, screen_round(x), screen_round(y), 1, 1, c_white, image_alpha);
	}
	
	//If there's a path at the top
	if (pathV) 
	&& (pathV.image_alpha == 1) {
	
		draw_sprite_part_ext(spr_path_v, 2, 0, 0, 16, 16, screen_round(x), screen_round(y), 1, 1, c_white, image_alpha);
	}
	
	//Draw node
	draw_sprite_ext(spr_path_node_b, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, image_alpha);
}