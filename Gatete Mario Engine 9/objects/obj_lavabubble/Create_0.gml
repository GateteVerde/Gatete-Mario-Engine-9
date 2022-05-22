/// @description Lava Bubble

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 2;

//How vulnerable is this enemy to Mario?
stomp = 2;

//How vulnerable is this enemy to Yoshi?
edible = 2;

//Whether the Lava Bubble is jumping
ready = 0;

//Gravity
yadd = 0.2;

//Set depth
depth = 150;

//Leave trail when moving up
alarm[3] = 1;

//Shake
offset = 0;
offsetdir = 1;
alarm[4] = 1;
