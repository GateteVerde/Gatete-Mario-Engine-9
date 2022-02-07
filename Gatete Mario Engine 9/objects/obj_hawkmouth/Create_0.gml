/// @description Hawkmouth Gate

//Do not animate
image_speed = 0;
image_index = 0;

//Jaw position
jaw_y = 0;

//Whether the gate is opening
ready = 0;

//Facing direction
xscale = (position_meeting(x-9, y, obj_solid)) ? -1 : 1;

//Make it solid on top
mytop = instance_create_layer(x+8, bbox_top, "Main", obj_slopeparent);
with (mytop)
	sprite_index = spr_mask_hawkmouth