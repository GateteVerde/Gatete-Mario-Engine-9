/// @description Pause before sweeping to the right.

//Do not stop if the direction is not 270
if (direction != 270) {

    alarm[4] = 1;
    exit;
}

direction = 270;
x = 64;
y = 48;
ready = 0;
speed = 0;
alarm[5] = 22;
