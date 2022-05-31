/// @description Boo Stream

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 99;

//How vulnerable is this enemy to the player?
stomp = 2;

//How vulnerable is this enemy to yoshi?
edible = 3;

//Facing direction
xscale = 1;

//No swimming
noswim = true;

//Start moving
alarm[10] = 2;

//Do not animate
image_speed = 0;

//Set up the frame
image_index = choose(0, 2, 4);
frame = 0;
alarm[0] = 7;
