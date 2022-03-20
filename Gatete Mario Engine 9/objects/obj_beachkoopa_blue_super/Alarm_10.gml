/// @description Move towards Mario

//Jump again
alarm[0] = 30;

//If Mario does not exist or it is at the left   
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xspeed = -1.75;
else
    xspeed = 1.75;