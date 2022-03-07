/// @description Start moving

//Detect the player and fly towards him
if (!instance_exists(obj_mario))
|| (obj_mario.y < y)
    dir = -1;
else
    dir = 1;