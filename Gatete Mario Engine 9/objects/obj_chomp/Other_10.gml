/// @description Chain Chomp kill

//Create dead object.
imdead = instance_create_depth(x, y, -6, obj_enemy_dead);

//Set the sprite
imdead.sprite_index = sprite_index;

//Set the facing direction
imdead.image_xscale = xscale;

//Set a waving movement
imdead.hspeed = 0.5;
imdead.alarm[1] = 4;

//Set the vertical speed
imdead.vspeed = -6;

//Dead followers.
multidead = instance_create_depth(x, y, -6, obj_enemy_dead_multi);
with (multidead) {

    //Set the sprite
    sprite_index = spr_chainchomp_chain;

    //Set the enemy parts.
    count = 4;
    
    //Set the xscale
    image_xscale = other.xscale;
}

//Destroy
instance_destroy();

