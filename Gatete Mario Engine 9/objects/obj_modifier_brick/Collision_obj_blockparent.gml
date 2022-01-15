/// @description Turn into a brick block

//If this is a question block
if (other.sprite_index == spr_qblock) {

	other.sprite_index = spr_brick;
	other.shard_sprite = spr_shard_brick;
}

//Destroy this modifier
instance_destroy();