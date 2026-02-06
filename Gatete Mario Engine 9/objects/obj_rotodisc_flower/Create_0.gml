/// @description Flower Rotodisc Manager

var a;
a = 360/discs;

//Create the discs
repeat (discs) {

    ID = instance_create_depth(x, y, -4, obj_rotodisc_disc_flower);
    with (ID) {
    
        angle		= a;
        clockwise	= other.clockwise;
        distance	= other.distance;
        spd			= other.spd;
    }
    a += 360/discs;
}