/// @description Bowser Statue

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 99;

//How vulnerable is this enemy to Mario?
stomp = -1;

//How vulnerable is this enemy to Yoshi?
edible = 3;

//Make it solid
mysolid = instance_create_layer(x-8, y, "Main", obj_solid);

//Start blowing fire
alarm[0] = 120;

//Face towards the player
alarm[10] = 2;
