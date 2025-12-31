/// @description Blargg

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 99;

//How vulnerable is this enemy to Mario?
stomp = 2;

//How edible is this enemy to Yoshi?
edible = 2;

//Does this enemy turn into a silver coin?
turn_silver = 0;

//Ignore platforms
ignore_platforms = true;

//Do not animate
image_speed = 0;
image_index = 0;

//Depth
depth = 100;

//Move 16 pixels down
y += 16;

//Move up
alarm[0] = 60;
