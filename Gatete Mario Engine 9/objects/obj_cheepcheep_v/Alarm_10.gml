/// @description Start moving

//Set turning endpoint
if (prevswim == 0) {

    prevswim = 1;
    yy = y;
}

//Move towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.y < y)
    yspeed = -0.5;
else
    yspeed = 0.5;
