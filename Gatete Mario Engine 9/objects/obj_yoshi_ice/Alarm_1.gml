/// @description Leave a trail

alarm[1] = 4;
with (instance_create_depth(x, y, -2, obj_smoke)) {

    image_speed = 0.3;
    sprite_index = spr_ice;
}