/// @description Default stomp script

//Create dead object
imdead = instance_create_depth(x, y, depth, obj_enemy_stomped);

//Hereby sprite
imdead.sprite_index = spr_rockywrench_dead;

//Hereby frame
imdead.image_index = image_index;

//Hereby facing direction
imdead.image_xscale = xscale;

//Destroy
instance_destroy();