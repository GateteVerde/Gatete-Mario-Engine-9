/// @description Show Jumping Lui effect if jumping

//If Mario has the Jumping Lui powerup
if (global.powerup == cs_lui) {

	//If Mario is jumping
	if (jumping > 0)	
		instance_create_depth(x, y, -4, obj_lui_trail);
}

//Repeat the process
alarm[7] = 2;