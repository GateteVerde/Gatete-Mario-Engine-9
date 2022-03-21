/// @description Hammer logic

//Set the falling speed.
if (vspeed > 4) {

    vspeed = 4;
    gravity = 0;
}

//Destroy outside room.
if (bbox_top > room_height)
    instance_destroy();