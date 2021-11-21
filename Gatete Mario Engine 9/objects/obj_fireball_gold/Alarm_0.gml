/// @description Leave a trail

alarm[0] = 4;
with (instance_create_depth(x-8 + random(16), y + random(16), -1, obj_sparkle))
    sprite_index = spr_sparkle_b;