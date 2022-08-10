/// @description Block parent object

//Do not animate
image_speed = 0;

//Whether this block can be hit
ready = 0;

//Set up depth
depth = layer_get_depth("Main");

//Make it solid
mysolid = instance_create_layer(x, y, "Main", obj_solid);
with (mysolid) {

	image_xscale = 0.5;
	image_yscale = 0.5;
}