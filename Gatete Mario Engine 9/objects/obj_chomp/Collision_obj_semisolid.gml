/// @description Floor collision

//Deny if above the origin
if (other.y < ystart)
exit;

//If there's a platform nearby and the vertical speed is greater than 0.
if ((y < other.y-3) && (yspeed > 0)) {

    //Snap to position.
    y = other.y-8;
    
    //Stop vertical speed.
    yspeed = -1.5;
    yadd = 0;
    
    //Lunge at Mario again
    if (ready == 1)
        ready = 0;
}
