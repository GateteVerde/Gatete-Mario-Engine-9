/// @description Handle rotodisc positions

//If the discs are active
if (active) {

    for (i=0; i<discs; i++;) {
    
        mydisc[i].x = x + 8 + distance*cos((angle+(i*360/discs))*pi/180);
        mydisc[i].y = y + 8 + distance*sin((angle+(i*360/discs))*pi/180);
    }
}

//Disc angle
angle += spd*(clockwise*-1);
if (angle > 360)
    angle -= 360;