/// @description Wall spring

//Do not animate
image_speed = 0;
image_index = 0;

//Whether the player is on the trampoline
ready = 0;
ready2 = 0;

//Invert it's direction if there's a wall to the left
if (collision_point(x-25, y+4, obj_solid, 1, 1))
    image_xscale = -1;