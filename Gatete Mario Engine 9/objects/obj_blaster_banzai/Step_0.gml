/// @description Scale the cannon

//If scaling up
if (ready == 1) {

    scale += 0.02;
    if (scale > 1.1) {
    
        scale = 1.1;
        ready = 2;
    }
}

//Otherwise, if scaling down
else if (ready == 2) {

    scale -= 0.02;
    if (scale < 1) {
    
        scale = 1;
        ready = 0;
    }
}

//Set depth
depth = -2;
