/// @description Decrement timer

if (ready == 1) {

	//Decrement time
	if (time > 1) {
		
		time--;
		alarm[0] = 60;
	}
	
	//Otherwise, if the timer is 1
	else if (time == 1) {
	
		//End timer
		time = 0;
		
		//Set gravity
		ready = 2;
		gravity = 0.1;
	}
}