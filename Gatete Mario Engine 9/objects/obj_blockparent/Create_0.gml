/// @description Block parent object

//Shard sprite
shard_sprite = -1;

//Whether this block can be hit
ready = 0;

//Set up depth
depth = layer_get_depth("Main");

//Make it solid
mysolid = instance_create_layer(x, y, "Main", obj_solid);
with (mysolid) {

	image_xscale = other.sprite_width/16;
	image_yscale = other.sprite_height/16;
}