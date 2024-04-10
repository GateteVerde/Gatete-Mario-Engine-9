/// @description Standard Question Mark Block

//Inherit the parent event
event_inherited();

//If the block uses a brick block sprite, copy frames from a existing brick block
if (sprite_index == spr_brick) {
	
	if (instance_exists(obj_brick))
		image_index = obj_brick.image_index;
	else
		image_index = 0;
}