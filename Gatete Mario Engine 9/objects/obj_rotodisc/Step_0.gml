/// @description Handle rotodisc positions

//If the discs are active
if (active) {

    for (i=0; i<discs; i++;) {
    
        mydisc[i].x = x + 8 + dist*cos((angle+(i*360/discs))*pi/180);
        mydisc[i].y = y + 8 + dist*sin((angle+(i*360/discs))*pi/180);
    }
}

//Disc angle
angle += myspeed*(clockwise*-1);
if (angle > 360)
    angle -= 360;