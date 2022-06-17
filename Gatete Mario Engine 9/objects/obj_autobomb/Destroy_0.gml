/// @description Turn the rider into a regular shyguy

//Inherit the parent event
event_inherited();

//If the rider exists
if (instance_exists(rider)) {

    //Create a normal shyguy
    with (instance_create_depth(rider.x, rider.y, -2, obj_shyguy)) {
    
        xspeed = 0.5*sign(other.xscale);
    }
    
    //Destroy rider
    with (rider) instance_destroy();
}