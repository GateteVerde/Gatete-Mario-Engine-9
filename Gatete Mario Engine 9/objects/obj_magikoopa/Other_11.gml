/// @description Default stomp script

//Create dead object
imdead = instance_create_depth(round(bbox_left + bbox_right) / 2, round(bbox_top + bbox_bottom) / 2, -6, obj_enemy_stomped);

//Hereby sprite
imdead.sprite_index = spr_magikoopa;

//Hereby frame
imdead.image_index = image_index;

//Hereby facing direction
imdead.image_xscale = xscale;

//Destroy
instance_destroy();
