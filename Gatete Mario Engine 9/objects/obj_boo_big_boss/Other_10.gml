/// @description Default death script

//Create dead object
imdead = instance_create_depth(x, y, -6, obj_enemy_dead);

//Hereby sprite
imdead.sprite_index = spr_boo_big;

//Hereby frame
imdead.image_index = 0;

//Hereby facing direction
imdead.image_xscale = xscale;

//Destroy
instance_destroy();