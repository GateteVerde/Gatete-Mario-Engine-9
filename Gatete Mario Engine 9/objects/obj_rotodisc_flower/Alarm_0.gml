/// @description Create discs

//Temporary variable
var a;
a = 360/discs;

//Create the discs
repeat (discs) {

    ID = instance_create_depth(x, y, -4, obj_rotodisc_disc_flower);
    with (ID) {
    
        angle = a;
        clockwise = other.clockwise;
        maxradius = other.maxrad;
        speedd = other.myspd;
    }
    a += 360/discs;
}