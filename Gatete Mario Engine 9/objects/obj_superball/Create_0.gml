/// @description A superball shot by Mario

//Inherit event from parent
event_inherited();

//Set vertical speed
yspeed = 3;

//No bounces
bouncy = 0;
bounces = 0;

//Do not swim
noswim = true;

//Turn toward walls
turn_toward = true;
turn_toward_ceiling = true;

//Destroy after a while
alarm[0] = 180;