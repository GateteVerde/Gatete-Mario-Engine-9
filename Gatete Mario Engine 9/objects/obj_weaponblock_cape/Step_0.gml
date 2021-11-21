/// @description Break when diving down with the cape feather

//Inherit the parent event
event_inherited();

//If Mario is flying with the cape
if (instance_exists(obj_fly)) {

	//Check for the obj_fly object
	var fly = collision_rectangle(bbox_left - 4, bbox_top - 12, bbox_right + 4, bbox_top, obj_fly, 0, 0);
	
	//If there's a flying object
	if (fly)
	&& (fly.nose_diving > 0)
		event_user(15);
}