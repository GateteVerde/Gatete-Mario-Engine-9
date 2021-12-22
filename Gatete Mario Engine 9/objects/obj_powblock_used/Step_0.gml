/// @description Used POW block logic

//Grow
if (!ready) {

    scale += 0.15;
    if (scale > 2) {
    
        scale = 2;
        ready = 1;
    }
}

//Shrink
else if (ready) {

    scale -= 0.15;
    if (scale < 1) 
        instance_destroy();
}