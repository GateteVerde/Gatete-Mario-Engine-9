/// @description Ostro

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 1;

//How vulnerable is this enemy to Mario?
stomp = 3;

//Create rider
rider = instance_create_depth(x, y, -2, obj_shyguy_rider);

//Do not animate
image_speed = 0;
image_index = 0;

//Move towards Mario
alarm[10] = 2;