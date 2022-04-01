/// @description Buoy Platform Logic

//If a water surface exists
if (water != -1) 
&& (freeze == false) {
	
	//If the y position is greater than the water y position
	if (y > water.y-8) {
		
		//Stop gravity
		gravity = 0;
	
		//Set vertical speed
		vspeed -= 0.1;
	}
	else
		gravity = 0.1;
}

//Cap vertical speed
if (vspeed < -1) {

    vspeed = -1;
    if (sink == 1)
        sink = 2;
}
else if (vspeed > 3)
	vspeed = 3;