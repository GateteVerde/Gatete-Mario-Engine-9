/// @description Cycle between colours

if (state == 1) {

    alarm[1] = 4;
    color++;
    if (color > 3)
        color = 0;
}
else
    color = 0;
