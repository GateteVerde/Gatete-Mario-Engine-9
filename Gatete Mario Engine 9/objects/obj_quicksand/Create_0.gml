/// @description Quicksand

//Set depth
depth = -7;

//Create semisolid
mycol = instance_create_layer(x, y+4, "Main", obj_semisolid);
with (mycol)
    image_xscale = other.image_xscale;