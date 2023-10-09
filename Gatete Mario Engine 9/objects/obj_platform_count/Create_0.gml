/// @description Count Platform

//Inherit the parent event
event_inherited();

//Do not animate
image_speed = 0;
image_index = 0;

//Whether Mario is on this platform
ison = false;

//Whether this platform is falling
ready = 0;

//Count how many time this platform has been step on
count_last = 0;