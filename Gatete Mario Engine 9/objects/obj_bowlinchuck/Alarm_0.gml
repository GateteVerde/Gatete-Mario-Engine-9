/// @description Prepare a bowling ball

//If Mario does exist...
if (instance_exists(obj_mario)) {
	
	//Set the ball
	image_index = 2;
	
	//Is ready
	ready = 1;

    //Animate
    alarm[1] = 30;
}
else
    alarm[0] = 1;