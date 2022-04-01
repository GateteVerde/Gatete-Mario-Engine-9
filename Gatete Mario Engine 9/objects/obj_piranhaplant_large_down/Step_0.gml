/// @description Piranha plant logic

//If the object is frozen, stop
if (freeze == true)
exit;

//If the piranha plant is coming out
if (ready == 1) {

	y++;
	if (y > ystart+32) {
	
		//Snap in position
		y = ystart+32;
		
		//Come in
		ready = 2;
		alarm[0] = 90;
	}
}

//Otherwise, if the piranha plant is going inside
else if (ready == 3) {

	y--;
	if (y < ystart) {
		
		//Snap in position
		y = ystart;
	
		//Come out
		ready = 0;
		alarm[0] = 60;
	}
}
