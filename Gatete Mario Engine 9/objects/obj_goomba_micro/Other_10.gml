/// @description Flee away

//Create dead object.
imdead = instance_create_depth(x, y+8, depth, obj_enemy_dead);

//Set the sprite
imdead.sprite_index = sprite_index;

//Set the facing direction
imdead.image_xscale = 1*sign(yfix);

//Set the horizontal speed
imdead.hspeed = random_range(1,-1);

//Destroy
instance_destroy();