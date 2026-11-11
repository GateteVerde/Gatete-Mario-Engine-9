/// @description Bounce in contact with a wall triangle

if ((yspeed == 0) && ((xspeed > 0) && (x > other.x))) {

    yspeed = -4;
    y--;
}