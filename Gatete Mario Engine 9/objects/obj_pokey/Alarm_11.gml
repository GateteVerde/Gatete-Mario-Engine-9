/// @description Move towards Mario

//If not moving
if (xspeed != 0) {

    //If Mario does not exist or it's at the left.
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xspeed = -0.2;
    else
        xspeed = 0.2;
}

//Move towards Mario
alarm[11] = 60;
