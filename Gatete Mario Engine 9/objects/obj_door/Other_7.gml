/// @description Start warp sequence

//Stop animation
image_speed = 0;
image_index = (sprite_index == spr_door_ghost) ? 3 : 2;

//Perform warp event
with (obj_mario_door) alarm[0] = 32;