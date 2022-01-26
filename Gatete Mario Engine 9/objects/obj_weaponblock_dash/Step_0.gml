/// @description Break when approaching while doing a shoulder bash as Football Mario

//Inherit the parent event
event_inherited();

//If Mario is doing a shoulder bash a la Wario) 
if (global.powerup == cs_football) {

	//Check for a invincibility mask
	var mario = collision_rectangle(bbox_left-6, bbox_top, bbox_right+6, bbox_bottom, obj_mario, 1, 0)

	//If there's a lightning bolt in position
	if (mario)
	&& (mario.run == true)
		event_user(15);
}