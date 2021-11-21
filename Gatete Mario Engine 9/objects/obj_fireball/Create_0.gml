/// @description A fireball shot by Mario

//Inherit event from parent
event_inherited();

//Set vertical speed
yspeed = 3;

//No bounces
bouncy = 0;
bounces = 0;

//Do not swim
noswim = true;

//Do not turn toward walls
turn_toward = false;

//Leave a trail
alarm[0] = 1;