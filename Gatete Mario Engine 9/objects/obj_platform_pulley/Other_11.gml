/// @description Make both platforms fall.

if (ready == 0) {

    vspeedmax = 1;
    if (y < limit) {
        
        //Make the platform fall.
        speed = 0;
        ready = 1;
        
        //Make the other platform fall.
        with (parent) {
        
            speed = 0;
            ready = 1;
        }  
    }   
}
else
vspeedmax = 3;

//Cap vertical speed.
if (vspeed > vspeedmax)
    vspeed = vspeedmax;
if (vspeed < -vspeedmax)
    vspeed = -vspeedmax;