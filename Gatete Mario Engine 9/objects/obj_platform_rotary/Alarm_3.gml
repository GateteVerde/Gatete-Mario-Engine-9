/// @description Stop and create spin mask

//Create spin mask
myspin = instance_create_layer(x, y+2, "Main", obj_platform_rotary_spin);

//Stop animation
image_speed = 0;
image_index = 0;

//Go again
alarm[1] = 100;

//Increment speed
morespeed = 3;