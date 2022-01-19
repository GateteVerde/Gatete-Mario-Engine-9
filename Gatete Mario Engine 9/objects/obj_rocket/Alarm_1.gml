/// @description Shake

if (vspeed == -2.5) {

    port_x = 0;
    port_y = 0;
}
else {

    port_x = random_range(1,-1);
    port_y = random_range(1,-1);
    alarm[1] = 2;
}