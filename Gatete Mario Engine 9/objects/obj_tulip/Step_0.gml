/// @description Tulip logic

//Show message
showing = (collision_rectangle(bbox_left-32, bbox_top-32, bbox_right+32, bbox_bottom+32, obj_mario, 0, 0)) ? 1 : 0;

//Animate based on position
image_speed = 0.15 + (0.15 * showing);