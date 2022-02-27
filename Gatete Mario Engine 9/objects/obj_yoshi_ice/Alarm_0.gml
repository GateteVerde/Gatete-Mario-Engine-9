/// @description Set scale and horizontal speed

//If not moving up/down
if (yspeed == 0) {

    if (xspeed > 0)
        xspeed = 3;
    else if (xspeed < 0)
        xspeed = -3;
}
else {

    if (xspeed > 0)
        xspeed = 2.5;
    else if (xspeed < 0)
        xspeed = -2.5;
}

//Scale
xscale = 1*sign(xspeed);