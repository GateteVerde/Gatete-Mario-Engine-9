/// @description Create dead enemy parts.

//Create dead object.
imdead = instance_create_depth(x, y, -4, obj_enemy_dead);

//Set the sprite
imdead.sprite_index = sprite_index;

//Set the facing direction
imdead.image_xscale = xscale;

//Set the vertical speed
imdead.vspeed = spd;

//Set the horizontal speed.
imdead.hspeed = 0.5;
imdead.alarm[1] = 4;

//Decrement count and destroy.
count--;
if (count > 0)
    alarm[0] = 8;
else
    instance_destroy();
