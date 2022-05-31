/// @description Create the Boos

var offset = 0;
repeat (boocount) {

    with (instance_create_depth(x+8, y, -2, obj_boo_circle_boo)) {
    
        time = offset;
        offset += ( ((2 * pi) / other.ringspeed ) / ((other.boocount) + other.gapsize));
        ringsize = other.ringsize;
        ringspeed = other.ringspeed;
        clockwise = other.clockwise;
    }
}
