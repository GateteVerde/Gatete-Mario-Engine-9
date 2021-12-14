/// @description Turn into a real block

//Create a new block and give it the same item
with (instance_create_depth(x, y, 9, obj_qblock)) {
		
	//Set the item to reveal
	sprout = other.sprout;
	
	//Set the sprite
	sprite_index = spr_area_b;
		
	//Do not animate
	image_speed = 0;
	image_index = 0;
		
	//Make them breakable
	shard_sprite = spr_shard_area_b;
}
	
//Destroy
instance_destroy();