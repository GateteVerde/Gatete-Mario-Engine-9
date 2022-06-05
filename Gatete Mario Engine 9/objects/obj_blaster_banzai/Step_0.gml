/// @description Scale the cannon

//If scaling up
if (ready == 1) {

    scale += 0.014;
    if (scale > 1.2) {
    
        scale = 1.2;
        ready = 2;
    }
}

//Otherwise, if scaling down
else if (ready == 2) {

    scale -= 0.014;
    if (scale < 1) {
    
        scale = 1;
        ready = 0;
    }
}

//Set depth
if (depth = 150)
&& (!place_meeting(x, y, obj_blaster_banzai))
	depth = -2;
