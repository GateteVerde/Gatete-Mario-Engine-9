/// @description Arrow Block

//Shard sprite
shard_sprite = -1;

//Whether this block can be hit
ready = 0;

//Do not animate
image_speed = 0;
image_index = 0;

//Set up depth
depth = layer_get_depth("Main");

//Make it solid
mysolid = instance_create_layer(x, y, "Main", obj_solid);
with (mysolid) {

	image_xscale = 1;
	image_yscale = 1;
}