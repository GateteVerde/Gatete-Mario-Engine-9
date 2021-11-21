/// @description Standard Breakable Block

//Inherit event from parent
event_inherited();

//Shard sprite
shard_sprite = spr_shard_brick;

//If there's a coin in the room, retrieve frame from them
if (instance_exists(obj_brick))
	image_index = obj_brick.image_index;
else
	image_index = 0;