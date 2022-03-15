/// @description Start moving

//If Mario does not exist or it's at the left
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    dir = -1;
else
    dir = 1;