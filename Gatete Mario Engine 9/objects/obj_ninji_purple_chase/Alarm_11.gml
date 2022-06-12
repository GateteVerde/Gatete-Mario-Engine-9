/// @description Follow Mario

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
alarm[11] = 60+round(random_range(60, 120));
