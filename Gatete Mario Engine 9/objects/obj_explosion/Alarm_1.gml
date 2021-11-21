/// @description Generate stars

//Generate effect
var a;
a = 0;
repeat (6) {

    eff = instance_create_depth(x, y+8, -2, obj_explosion_stars);
    with (eff) {
    
        dir = a;
    }
    a += 60;
}
alarm[2] = 8;