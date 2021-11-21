/// @description Initialize movement

//If the movement type is set to 0
if (type == 0) {

    //Make it solid
    myspin = instance_create_layer(x, y + 2, "Main", obj_platform_rotary_spin);
    
    //Start spinning
    alarm[1] = 45;
}

//Otherwise, spin infinitely
else if (type == 1) {

    //Create spin collision
    spincollision = instance_create_layer(x + 16, y - 24, "Main", obj_platform_rotary_collision);
    image_speed = 1.2;
}