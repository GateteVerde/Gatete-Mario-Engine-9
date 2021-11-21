/// @description Stop it

//If moving
if (speed > 0) {

	//Stop movement
	hspeed = 0;
	vspeed = 0;
	
	//Snap onto grid
	move_snap(16, 16);
	
	//Start moving again
	alarm[0] = 60;
}