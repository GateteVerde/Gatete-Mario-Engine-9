/// @description Key animation logic

//Keyhole growing
if (ready == 1) {

    scale += 0.02;
    if (scale >= 1)
        ready = 2;
}

//The player fades out
else if (ready == 2) {

    fade -= 0.1;
    if (fade <= 0)
        ready = 3;
}

//Keyhole shrinking
else if (ready == 3) 
&& (scale > 0)
    scale -= 0.02;