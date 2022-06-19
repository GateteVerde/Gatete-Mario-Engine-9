/// @description Toss a lightning

//Create a lightning
instance_create_depth(x-8, y+8, -2, obj_sumobro_lightning);

//Resume movement
stop = 0;

//Reset palette
pal = 0;

//Throw another lightning
alarm[0] = 150;