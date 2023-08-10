/// @description Manage credits sequence

//Draw first the background
if (ready == 1) {

    alpha += 0.025;
    if (alpha > 1) {
    
        alpha = 1;
        ready = 2;
        alarm[2] = 240;
    }
}
else if (ready == 3) {

    alpha -= 0.025;
    if (alpha < 0) {
    
        alpha = 0;
        ready = 4;
    }
}

//Update yy
if (ready == 4) {

    yy += 0.25;
    if (yy > 1160) { //To calculate this, look how many lines does "text" have and multiply the lines by 8.
    
        alpha += 0.025;
        if (alpha > 1) {
        
            alpha = 1;
            ready = 5;
            alarm[3] = 60;
        }
    }
}