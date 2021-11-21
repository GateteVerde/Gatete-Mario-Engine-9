/// @description A lightning bolt thrown by Mario

//Inherit event from parent
event_inherited();

//No bounces
bouncy = 0;
bounces = 0;

//Do not swim
noswim = true;

//Do not turn toward walls
turn_toward = true;

//Bounce in slopes
allow_bounce = 1;

//Destroy after a while
alarm[0] = 180;

//Leave a trail
alarm[2] = 1;