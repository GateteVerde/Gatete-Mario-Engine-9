/// @description Floor collision

//Deny if above the origin
if (other.y < ystart)
exit;

//If there's a platform nearby and the vertical speed is greater than 0.
if ((y < other.y+1) && (vspeed > 0)) {

    //Snap to position.
    y = other.yprevious-4;
    
    //Stop vertical speed.
    vspeed = 0;
    gravity = 0;
}
