/// @description Turn into a dino-torch

with (instance_create_depth(x, y, -2, obj_dinotorch)) {

    xscale = other.xscale;
    image_speed = 0;
    image_index = 0;
    alarm[0] = 30;
    alarm[10] = -1;
}

instance_destroy();