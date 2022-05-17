/// @description Wall collision
	
//Check for a platform
platform_l = collision_rectangle(bbox_left+hspeed, bbox_top+1, bbox_left, bbox_bottom-4, obj_platformparent, 1, 0);
platform_r = collision_rectangle(bbox_right, bbox_top+1, bbox_right+hspeed, bbox_bottom-4, obj_platformparent, 1, 0);
