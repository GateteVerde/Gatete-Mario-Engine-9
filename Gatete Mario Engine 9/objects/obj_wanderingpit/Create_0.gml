/// @description Wandering Pit

/*
//  This object must be used along with obj_tilelayermanager
*/

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 100;

//How vulnerable is this enemy to Mario?
stomp = -1;

//How vulnerable is this enemy to Yoshi?
edible = 3;

//Start moving
alarm[10] = 2;
