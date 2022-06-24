/// @description Enemy Generator Pipe

//Inherit the parent event
event_inherited();

//Manage movement
ready = 0;

//Scale
xscale = 1;

//Set depth
depth = 150;

//Do not animate
image_speed = 0;
image_index = 0;

//Previous delay (It increments as long the player is visible)
delayprev = 0;