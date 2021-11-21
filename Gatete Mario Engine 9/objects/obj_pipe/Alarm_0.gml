/// @description Allow stomp

if (!collision_rectangle(bbox_left, bbox_top-4, bbox_right, bbox_top-4, obj_mario, 0, 0))
	stomped = 0;
else
	alarm[0] = 1;