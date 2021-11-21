/// @description Timed Platform

/*
//	This object uses creation code
//
//	time	= Number of seconds this platform will move till it falls (Min: 1, Max: 9)
*/

//Default value
time = 1;

//Inherit the parent event
event_inherited();

//Depth
depth = -2;

//Time restart
time_rst = 0;

//Whether this platform is moving
ready = 0;