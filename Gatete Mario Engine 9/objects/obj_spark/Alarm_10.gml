/// @description Start moving

//Check where Mario is and move in said direction
if (!instance_exists(obj_mario)) || (obj_mario.x < x)
    xscale = -1;
else
    xscale = 1;

//Set the speed
speed = spd * xscale;
