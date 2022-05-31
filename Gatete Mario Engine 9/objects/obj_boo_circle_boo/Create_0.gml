/// @description Circle Boo

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 99;

//How vulnerable is this enemy to the player?
stomp = 2;

//How vulnerable is this enemy to yoshi?
edible = 3;

//Facing direction
xscale = choose(1, -1);

//Circle timer
time = 0;

//Ring variables
ringsize = 0;
ringspeed = 0;
clockwise = 1;

//Animate
image_speed = 0;

//Set up the frame
image_index = choose(0, 2, 4);
frame = 0;
alarm[0] = 7;
