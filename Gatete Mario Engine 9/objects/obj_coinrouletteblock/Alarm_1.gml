/// @description Finish block bump

//Stop moving
speed = 0;

//Snap in start position
x = xstart;
y = ystart;

//Turn into a used block
with (instance_create_depth(x, ystart, depth, obj_emptyblock)) sprite_index = spr_coinrouletteblock_empty;

//Destroy
instance_destroy();