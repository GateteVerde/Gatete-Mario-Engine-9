/// @description Make Mario run depending of his direction

//Make Mario run from the ceiling to the left wall
if ((direct == 1) && (direction = 180)) {

    x = other.x+16;
    y = other.y+16;
    direction = 270;
}

//Make Mario run from the left wall to the ceiling
else if ((direct == -1) && (direction == 90)) {

    x = other.x+32;
    y = other.y;
    direction = 0;
}