/// @description Effect logic

//If the effect is not ready
if (ready == false) {

    //If moving down
    if ((vspeed > 0) && (y > ystart-15)) {
    
        //Stop moving
        vspeed = 0;
        gravity = 0;
        
        //Snap in position
        y = ystart-16;
        
        //Destroy after a while
        ready = true
        alarm[0] = 48;
    }
}

//If this shows you collected the last coin
if (ready2 > 0) {

	//Set scale
	if (ready2 == 1) {
			
		scale += 0.15;
		if (scale > 2)
			ready2 = 2;
	}
	else if (ready2 == 2) {
	
		scale -= 0.15;
		if (scale < 1)
			ready2 = 1;
	}
	
	//Set palette index
	flash++;
	if (flash > 13)
		flash = 0;
}