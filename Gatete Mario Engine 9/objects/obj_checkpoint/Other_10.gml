/// @description Create sparkles

//Create slow spark effects
var a = 0;
repeat (8) {

    with (instance_create_depth(x+8, y+4, -4, obj_sparkle)) {
    
		sprite_index = spr_sparkle_b;
		shrink_rate = 0.0324;
		motion_set(a, 0.5);
    }
    a += 45;
}

//Create fast spark effects
var b = 22.5;
repeat (8) {

    with (instance_create_depth(x+8, y+4, -6, obj_sparkle)) {
    
		sprite_index = spr_sparkle_b;
		shrink_rate = 0.0324;
		motion_set(b, 1);
    }
    b += 45;
}

//Get 2000 points
with (instance_create_depth(x+8, y, -4, obj_score))
    value = 2000;