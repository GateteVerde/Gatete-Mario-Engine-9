/// @description Check if stopped and shrink the effect until it gets destroyed.

if (speed == 0) {

    scale -= 0.05;
    if (scale < 0.05)
        instance_destroy();
}