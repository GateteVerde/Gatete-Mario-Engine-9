/// @description Winged Question Mark Block

/*
//	This object uses creation code
//
//	sprout = Use macro list
//
//  backnforth = Whether if the block moves back and forth
//      true = Enable
//      false = Disable
*/

//Default value
sprout = cs_coin;
backnforth = true;

//Makes the object fully solid
issolid = true;

//Makes the object not carry Mario or NPCs horizontally
no_horiz = false;

//Whether the block is ready
ready = 0;

//Direction
dir = -1;

//Anim
anim = 0;

//Start moving
alarm[0] = 2;