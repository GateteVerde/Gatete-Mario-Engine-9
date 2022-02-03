/// @description When the flag reaches the bottom of the flagpole

if (y > other.y+144) {

    //Stop moving
    vspeed = 0;

    //Snap to bottom of the flagpole
    y = other.y+144;
}