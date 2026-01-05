/// @description Wiggler body logic

//Set vulnerability
vulnerable = (instance_exists(parent)) ? 1 : 99;

//Manage facing direction of the body parts
if (instance_exists(prevsegment) ) {

    if ((xscale = 1) && (x > prevsegment.x))
        xscale = -1;
    else if ((xscale = -1) && (x < prevsegment.x)) 
        xscale = 1;
}