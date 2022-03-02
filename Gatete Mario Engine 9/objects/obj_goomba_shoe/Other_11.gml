/// @description Default stomp script

//Create dead object
imdead = instance_create_depth(x, y, -6, obj_enemy_stomped);

//Hereby sprite
imdead.sprite_index = spr_shoe_kuribo;

//Hereby frame
imdead.image_index = anim;

//Hereby facing direction
imdead.image_xscale = xscale;

//Destroy
instance_destroy();