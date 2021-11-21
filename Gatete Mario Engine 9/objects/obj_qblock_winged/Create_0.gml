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

//Inherit event from parent
issolid = true;

//Whether the block is ready
ready = 0;

//Direction
dir = -1;

//Anim
anim = 0;

//Start moving
alarm[0] = 2;