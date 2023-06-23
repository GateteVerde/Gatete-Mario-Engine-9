/// @description Note Block

//Do not animate
image_speed = 0;
image_index = 0 + (x / 16);

//Whether this object has been bumped from above
bottom = false;

//Shard sprite
shard_sprite = -1;

//Whether this block can be hit
ready = 0;

//Offset
yoffset = 0;

//Set up depth
depth = layer_get_depth("Main");

//Make it solid
mysolid = instance_create_layer(x, y+3, "Main", obj_solid);
with (mysolid) 
	image_yscale = 0.8125;