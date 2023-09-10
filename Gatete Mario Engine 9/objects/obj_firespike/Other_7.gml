/// @description Stop throwing animation

if (sprite_index == spr_firespike_throw) {

    //Stop animation
    sprite_index = spr_firespike_throw_b;
    
    //Create ball...
    myball = instance_create_depth(x, y-16, -2, obj_firespike_fireball);
    with (myball) {
    
        parent = other.id;
    }
    
    //...and throw it away.
    alarm[1] = 30;
}