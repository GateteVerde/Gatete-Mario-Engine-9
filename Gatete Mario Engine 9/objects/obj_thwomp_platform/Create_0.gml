/// @description Platform Thwomp

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 3;

//How vulnerable is this enemy to Mario?
stomp = 3;

//How vulnerable is this enemy to Yoshi?
edible = 3;

//Whether the thwomp is falling
ready = 0;

//Is this enemy heavy?
isheavy = 2;

//Do not turn into silver coins
turn_silver = 0;

//No platform collision
ignore_platforms = true;

//A collision object for the player to ride
mytop.image_xscale = 2;

//Do not animate
image_speed = 0;
image_index = 0;
