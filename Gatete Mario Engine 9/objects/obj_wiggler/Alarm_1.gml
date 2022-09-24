/// @description Cycle between colours

if (state == 1) {

    alarm[1] = 1;
    color++;
    if (color > 7)
        color = 0;
}
else
    color = 0;
