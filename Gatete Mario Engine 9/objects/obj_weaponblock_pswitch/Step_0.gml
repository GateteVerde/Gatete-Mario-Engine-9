/// @description Break when Mario makes contact with the block while the P-Switch is active

//Inherit the parent event
event_inherited();

//If Mario exists
if (instance_exists(obj_mario)) {

	//Check for a invincibility mask
	var mario = collision_rectangle(bbox_left-6, bbox_top-6, bbox_right+6, bbox_bottom+6, obj_mario, 1, 0)

	//If there's a lightning bolt in position
	if (mario)
	&& (obj_levelcontrol.pswitch_on == true)
		event_user(15);
}