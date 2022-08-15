/// @description Birdo

//Inherit the parent event
event_inherited();

//Is this enemy heavy?
isheavy = 2;

//How vulnerable is this enemy to various items
vulnerable = 99;

//How vulnerable is this enemy to Mario?
stomp = 3;

//Do not turn into silver coins
turn_silver = 0;

//HP
hp = 3;

//Movement direction
dir = -1;

//Whether birdo is jumping
jumping = 0;

//Whether birdo is about to spit an egg
shooting = 0;

//Do not animate
image_speed = 0;
image_index = 0;

//Jump
alarm[0] = 180;

//Start moving
alarm[10] = 2;