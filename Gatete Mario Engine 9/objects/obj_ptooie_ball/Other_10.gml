/// @description Kill the ball

//Create dead object
imdead = instance_create_depth(x, y+8, -6, obj_enemy_dead);

//Set the sprite
imdead.sprite_index = sprite_index;

//Set the xscale
imdead.image_xscale = 1;

//Set the vertical speed
imdead.vspeed = vspeed;

//Destroy
instance_destroy();
