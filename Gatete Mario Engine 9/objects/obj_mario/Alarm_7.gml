/// @description Show Jumping Lui effect if jumping

//If Mario has the Jumping Lui powerup
if (global.powerup == cs_lui) {

	//If Mario is jumping
	if (global.mount == 0)
	&& (jumping > 0)
	&& (wallkick != 1)
	&& (groundpound == 0)
	&& (!instance_exists(obj_mario_transform))
		instance_create_depth(x, y, -4, obj_lui_trail);
}

//Repeat the process
alarm[7] = 2;