/// @description Break when approaching while under the effect of the P-Wing

//Inherit the parent event
event_inherited();

//If Mario is under the effect of the P-Wing
if (global.pwing == 1) {

	//Check for a invincibility mask
	var mario = collision_rectangle(bbox_left-6, bbox_top-6, bbox_right+6, bbox_bottom+6, obj_mario, 1, 0)

	//If there's a lightning bolt in position
	if (mario)
		event_user(15);
}