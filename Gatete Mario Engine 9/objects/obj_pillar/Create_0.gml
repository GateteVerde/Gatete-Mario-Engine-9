/// @description Pillar

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 99;

//How vulnerable is this enemy to Mario?
stomp = -1;

//How edible is this enemy to Yoshi?
edible = 2;

//Turn into silver coin?
turn_silver = 0;

//Start at the top of the screen
y -= 144;

//State variable
ready = 0;

//Depth
depth = layer_get_depth("Tileset") + 50;

//Start crusher animation
alarm[0] = 30;