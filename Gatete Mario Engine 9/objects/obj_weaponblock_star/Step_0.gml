/// @description Break when approaching while under the starman effect

//Inherit the parent event
event_inherited();

//If Mario is flying with the cape
if (instance_exists(obj_invincibility)) {

	//Check for a invincibility mask
	var star = collision_rectangle(bbox_left-4, bbox_top-4, bbox_right+4, bbox_bottom+4, obj_invincibility, 1, 0)

	//If there's a lightning bolt in position
	if (star)	
		event_user(15);
}