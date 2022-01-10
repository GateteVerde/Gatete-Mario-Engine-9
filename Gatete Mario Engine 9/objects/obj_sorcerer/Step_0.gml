/// @description Sorcerer logic

//If growing
if (ready == 0) {
	
	//Increment scale
    scale += 0.0125;
	
	//If the scale is big enough, revert
    if (scale > 1.5) {
		
        ready = 1;
        scale = 1.5;
    }
}

//If shrinking
else {
	
	//Decrement scale
    scale -= 0.0125;
	
	//If the scale is small enough, revert
    if (scale < 1) {
		
        ready = 0;
        scale = 1;
    }
}   