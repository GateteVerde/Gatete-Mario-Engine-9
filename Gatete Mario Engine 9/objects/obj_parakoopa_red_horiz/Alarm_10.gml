/// @description Start moving

//Move downwards
yspeed = 0.5;

//Detect the player and fly towards him
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    dir = -1;
else
    dir = 1;