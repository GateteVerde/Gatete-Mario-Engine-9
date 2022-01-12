/// @description Heart

//If collected
if (ready == 1) {

	//If fully scaled down
	if (scale < 0.05) {
	
		instance_create_depth(x + 8, y + 8, -4, obj_smoke);
		instance_destroy();
		exit;
	}
	
	//Change angle
	angle += 4;
	
	//Decrement scale
	scale -= 0.0125;
}

//Otherwise
else if (ready == 0) {

    if (ready2 == 0) {
    
        scale += 0.05;
        if (scale > 1.75)
            ready2 = 1;
    }
    else {
    
        scale -= 0.1;
        if (scale < 1) {
			
            ready2 = 0;
			dir = -dir;
		}
    }
}