/// @description Break with vegetables

//Inherit the parent event
event_inherited();

//Check for a vegetable
var veg = collision_rectangle(bbox_left-6, bbox_top-6, bbox_right+6, bbox_bottom+6, obj_carryparent, 1, 0)

//If there's a vegetable in position
if (veg)
&& (veg.held == 0)
	event_user(15);