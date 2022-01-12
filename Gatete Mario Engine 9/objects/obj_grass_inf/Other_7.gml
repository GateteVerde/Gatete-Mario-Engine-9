/// @description Update animation

if (sprite_index == spr_grass_grow) {
	
	sprite_index = spr_grass;
	if (instance_exists(obj_pullparent))
		image_index = obj_pullparent.image_index;
}