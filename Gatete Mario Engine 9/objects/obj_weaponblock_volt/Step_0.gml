/// @description Break with a lightning bolt

//Inherit event from parent
event_inherited();

//Check for a volt
var volt = collision_rectangle(bbox_left-6, bbox_top-6, bbox_right+5, bbox_bottom+5, obj_volt, 1, 0)

//If there's a lightning bolt in position
if (volt) {
	
	event_user(15);
	with (volt)
		instance_destroy();
}