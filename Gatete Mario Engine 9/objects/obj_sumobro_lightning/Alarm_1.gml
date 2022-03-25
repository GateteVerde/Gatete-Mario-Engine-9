/// @description Create flames and destroy

instance_create_depth(x-32, y+1, -2, obj_sumobro_flame);
instance_create_depth(x+32, y+1, -2, obj_sumobro_flame);
instance_destroy();