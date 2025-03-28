/// @description Loop tilt head animation 3 times

loop++;
if (loop > 3) {

	//End animation
	image_speed = 0;
	image_index = 0;
	
	//Loop
	loop = 0;
	
	//Throw a ball again
	alarm[0] = 120;
}
else
	image_index = 4;