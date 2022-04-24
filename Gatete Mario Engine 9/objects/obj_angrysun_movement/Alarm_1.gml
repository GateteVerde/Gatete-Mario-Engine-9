/// @description Pause before sweeping to the left.

//Do not stop if the direction is not 270
if (direction != 270) {

    alarm[1] = 1;
    exit;
}

x = 304;
y = 48;
ready = 0;
speed = 0;
alarm[2] = 22;
