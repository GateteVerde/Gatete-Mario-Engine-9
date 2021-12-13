/// @description Generate bubble effect

alarm[3] = 60 + random_range(-30, 30);
if (swimming)
	instance_create_layer(x, bbox_top, "Main", obj_bubble);