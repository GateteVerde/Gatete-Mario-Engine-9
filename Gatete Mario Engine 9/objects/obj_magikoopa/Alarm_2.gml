/// @description Generate sparkles

alarm[2] = 4;
if (image_index == 1) {

    with (instance_create_depth(x-6+random(12), y-10+random(12), -6, obj_sparkle))
        sprite_index = spr_sparkle;
}
