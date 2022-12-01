/// @description Wiggler body logic

//Manage facing direction of the body parts
if (instance_exists(prevsegment) ) {

    if ((xscale = 1) && (x > prevsegment.x))
        xscale = -1;
    else if ((xscale = -1) && (x < prevsegment.x)) 
        xscale = 1;
}