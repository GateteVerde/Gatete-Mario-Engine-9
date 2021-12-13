/// @description P-Question Mark Block

/*
//	This object uses creation code
//
//	sprout = Use macro list
*/

//Default value
sprout = cs_coin;

//Shard sprite
shard_sprite = spr_shard;

//Whether this block can be hit
ready = 0;

//Set the sprite
sprite_index = spr_qblock;

//Set up depth
depth = layer_get_depth("Main");

//Make it solid
mysolid = noone;