/// @description Toss a lightning

//Create a lightning
with (instance_create_depth(x-8, y+8, -2, obj_sumobro_lightning)) explode = 1;

//Resume movement
stop = 0;

//Reset palette
pal = 0;

//Throw another lightning
alarm[0] = 150;