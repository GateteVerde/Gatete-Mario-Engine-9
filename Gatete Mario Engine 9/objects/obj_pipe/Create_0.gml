/// @description Purely decorative pipe

//Depth
depth = layer_get_depth("Main");

//Solid
mysolid = instance_create_depth(x, y, -2, obj_solid);
with (mysolid) {

	image_xscale = other.sprite_width/16;
	image_yscale = other.sprite_height/16;
}

//Whether this pipe has been broken
palette = 0;

//Whether this pipe has been stomped on
stomped = 0;