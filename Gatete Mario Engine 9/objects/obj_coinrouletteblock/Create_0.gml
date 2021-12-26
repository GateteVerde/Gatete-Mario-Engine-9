/// @description Coin roulette block

//Shard sprite
shard_sprite = spr_shard_big;

//Whether this block can be hit
ready = 0;

//Do not animate
image_speed = 0;
image_index = 0;
alarm[2] = 12;

//Set up depth
depth = layer_get_depth("Main");

//Make it solid
mysolid = instance_create_layer(x - 6, y - 12, "Main", obj_solid);
with (mysolid) {

	image_xscale = other.sprite_width/16;
	image_yscale = other.sprite_height/16;
}