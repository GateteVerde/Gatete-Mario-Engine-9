/// @description Gold Fireball logic

//Inherit the parent event
event_inherited();

//Bump blocks
var block = collision_rectangle(bbox_left-2, bbox_top-2, bbox_right+2, bbox_bottom+2, obj_blockparent, 0, 0);
if (block)
	event_user(0);