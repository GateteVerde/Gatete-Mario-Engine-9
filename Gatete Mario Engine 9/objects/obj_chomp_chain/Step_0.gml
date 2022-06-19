/// @description Chomp chain logic

//Cap vertical speed
if (vspeed > 4) {

    vspeed = 4;
    gravity = 0;
}

//Depth
depth = -1;