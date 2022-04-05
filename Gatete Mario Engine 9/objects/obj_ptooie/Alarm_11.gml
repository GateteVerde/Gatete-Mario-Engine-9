/// @description Change direction

if (xspeed != 0) {

    //If Mario does not exist or it's at the left
    if (!instance_exists(obj_mario))
    || (obj_mario.x < x)
        xspeed = -0.5;
    else
        xspeed = 0.5;
}

//Repeat the process
alarm[11] = 60 + random(round(60));
