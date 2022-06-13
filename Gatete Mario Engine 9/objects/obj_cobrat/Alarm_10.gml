/// @description Move towards Mario

if (xspeed == 0) {

    //Start moving
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xspeed = -1;
    else
        xspeed = 1;
}

//Follow Mario
alarm[11] = 60;

//Animate if it's not animating
image_speed = 1;
