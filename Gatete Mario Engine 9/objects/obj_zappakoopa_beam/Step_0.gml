/// @description Beam logic

//Increment alpha
alpha -= 0.016;

//Set scale for the beam
radius -= 0.16;
if ((radius < 0.16) && (beam == 0)) {

    //Stop
    beam = 1;

    //Make parent unleash the laser
    with (parent) alarm[3] = 1;
    
    //Destroy
    instance_destroy();
}
