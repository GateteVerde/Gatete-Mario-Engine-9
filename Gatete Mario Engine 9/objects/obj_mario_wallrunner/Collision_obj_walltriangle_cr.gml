/// @description Make Mario run depending of his direction

//Make Mario run from the right wall to the ceiling
if ((direct == 1) && (direction == 90)) {

    x = other.x-16;
    y = other.y;
    direction = 180;
}

//Make Mario run from the ceiling to the right wall
else if ((direct == -1) && (direction == 0)) {

    x = other.x;
    y = other.y+16;
    direction = 270;
}