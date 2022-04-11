/// @description Get details about the brick

//Get held sprite
sprite_index = other.held_sprite;

//Get shard sprites
shard_sprite = other.shard_sprite;

//Destroy
with (other) instance_destroy();
