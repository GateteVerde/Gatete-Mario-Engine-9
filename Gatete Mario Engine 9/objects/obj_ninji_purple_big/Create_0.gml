/// @description Big Ninji

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 1;

//How vulnerable is this enemy to Mario?
stomp = 3;

//Whether the enemy is jumping
jumping = 0;

//Do not animate
image_speed = 0;
image_index = 0;

//Start jumping
alarm[1] = 15+random(round(30));

//Collision scale
mytop.image_xscale = 2;