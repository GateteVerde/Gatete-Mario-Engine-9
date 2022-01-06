/// @description Mario is pulling out a item

//Set up the sprite
sprite_index = global.pull_sprite[global.powerup];

//Stop picking
alarm[0] = 180;

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