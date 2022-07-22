/// @description Follow the player

//If there's no gravity
if (xspeed != 0) {

    //Start moving
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xspeed = -1;
    else
        xspeed = 1;
}

//Change direction
alarm[11] = 30 + irandom_range(0, 30);