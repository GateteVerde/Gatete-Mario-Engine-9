/// @description Generate more stars

//Generate effect
var b;
b = 30;
repeat (6) {

    eff = instance_create_depth(x, y+8, -2, obj_explosion_stars);
    with (eff) {
    
        dir = b;
    }
    b += 60;
}
alarm[1] = 8;