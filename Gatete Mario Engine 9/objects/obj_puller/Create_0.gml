/// @description Mario is pulling out a item

//Do not animate
image_speed = 0;
image_index = 0;

//Stop picking
alarm[0] = 180;

//Frame
frame = 0;
alarm[1] = 1;

//Stop movement
with (obj_mario) {

    xspeed = 0;
    yspeed = 0;
    enable_control = false;
}

//Flashing
isflashing = 0;

//Destroy spinner
if (instance_exists(obj_spinner))
    with (obj_spinner) instance_destroy();