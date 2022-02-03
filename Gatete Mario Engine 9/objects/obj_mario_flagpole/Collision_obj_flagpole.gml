/// @description When Mario reaches the bottom of the flagpole

if (ready == 0) 
&& (y > other.y+144) {

    //Do not animate
    image_speed = 0;
    image_index = 0;

    //Stop moving
    vspeed = 0;

    //Snap to bottom of the flagpole
    y = other.y+144;

    //Ready to jump state
    ready = 1;
    
    //Face left
    image_xscale = -1;
}