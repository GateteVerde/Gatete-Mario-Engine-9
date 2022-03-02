/// @description Create a wearable kuribo shoe out of this shoe

//Create a shoe
with (instance_create_depth(x, y-2, -2, obj_getshoe)) {

    //Set the vertical speed
    yspeed = -3;
    
    //Set the facing direction
    dir = other.xscale;
}

//Create dead object
imdead = instance_create_depth(x, y, -6, obj_enemy_dead);

//Make the dead object hereby the sprite
imdead.sprite_index = spr_goomba;

//Make the dead object hereby the scale
imdead.image_xscale = xscale;

//Destroy
instance_destroy();