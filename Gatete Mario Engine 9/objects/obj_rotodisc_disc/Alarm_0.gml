/// @description Leave a trail

//Repeat
alarm[0] = 2;

//Leave a trail.
with (instance_create_depth(x, y, -2, obj_rotodisc_trail))
    pal = other.pal;