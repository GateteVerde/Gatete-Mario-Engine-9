/// @description Break when diving down with the cape feather

//Inherit the parent event
event_inherited();

//If Mario is flying with the cape
if (instance_exists(obj_dropdown)) {

	//Check for a drop
	var drop = collision_rectangle(bbox_left-6, bbox_top-6, bbox_right+5, bbox_bottom+5, obj_dropdown, 1, 0)

	//If there's a lightning bolt in position
	if (drop)	
		event_user(15);
}