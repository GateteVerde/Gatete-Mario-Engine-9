/// @description Default stomp script

//Create dead object
imdead = instance_create_depth(x, y, -6, obj_enemy_stomped);

//Hereby sprite
imdead.sprite_index = sprite_index;

//Hereby depth
imdead.depth = 150;

//Hereby frame
imdead.image_index = 2;

//Hereby facing direction
imdead.image_xscale = xscale;

//Destroy
instance_destroy();
