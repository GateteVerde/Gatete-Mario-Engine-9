/// @description Slowdown both platforms

if (vspeed > 0.025) {

    vspeed -= 0.025;
    with (parent) vspeed += 0.025;
}
else if (vspeed = 0.025) {

    vspeed = 0;
    with (parent) vspeed = 0;
}