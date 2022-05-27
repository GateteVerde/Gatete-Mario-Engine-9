/// @description Leave a trail

//Repeat
alarm[1] = 4;

//Create effect
with (instance_create_depth(x-6+random(12), y-6+random(12), -2, obj_sparkle))
    sprite_index = spr_sparkle;
