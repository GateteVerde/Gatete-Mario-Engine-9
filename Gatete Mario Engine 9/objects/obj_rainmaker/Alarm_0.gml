/// @description Lightning strike

//Generate
alarm[0] = 100+random(round(200));

//If this object can generate lightning
if (lightning == 1)
    instance_create_depth(0, 0, 500, obj_lightningsheet);