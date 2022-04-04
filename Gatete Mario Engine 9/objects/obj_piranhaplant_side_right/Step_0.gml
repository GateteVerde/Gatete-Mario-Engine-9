/// @description Piranha plant logic

//If the object is frozen, stop
if (freeze == true)
exit;

//If the piranha plant is coming out
if (ready == 1) {

	x++;
	if (x > xstart+32) {
	
		//Snap in position
		x = xstart+32;
		
		//Come in
		ready = 2;
		alarm[0] = 90;
	}
}

//Otherwise, if the piranha plant is going inside
else if (ready == 3) {

	x--;
	if (x < xstart) {
		
		//Snap in position
		x = xstart;
	
		//Come out
		ready = 0;
		alarm[0] = 60;
	}
}