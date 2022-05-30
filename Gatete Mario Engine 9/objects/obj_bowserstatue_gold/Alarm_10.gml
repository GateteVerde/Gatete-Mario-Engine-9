/// @description Face towards Mario

//Start jumping
alarm[0] = 100;

//Face towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;
