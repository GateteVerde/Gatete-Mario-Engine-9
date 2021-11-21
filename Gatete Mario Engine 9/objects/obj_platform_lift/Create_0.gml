/// @description Elevator Lift

/*
//	This object uses creation code
//
//	sideways = Pick from below
//		0: No horizontal movement
//		1: Right	
//		-1: Left
*/

//Default value
sideways = 0;

//Inherit the parent event
event_inherited();

//Arrow animation
anim = 0;

//Whether this platform is moving
ready = 0;

//Palette to be used
pal = 0;

//Checks if Mario is on
ison = 0;