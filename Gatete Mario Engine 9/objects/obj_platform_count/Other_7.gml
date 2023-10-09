/// @description Stop animation

//Stop animation
image_speed = 0;
image_index = 0;

//If this platform reached 0
if ((count == 0) && (ready == 0)) {
	
	//Make the platform fall
	ready = 1;
	
	//Set vertical speed
	vspeed = 0.5;
	alarm[0] = 15;
}