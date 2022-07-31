/// @description Big "Boo" (BOSS)

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 99;

//How vulnerable is this enemy to Mario?
stomp = -1;

//How vulnerable is this enemy to Yoshi?
edible = 3;

//Alpha
alpha = 0.1;

//Motion
angle = 0;

//Acceleration
accel = 0;

//Whether the Boo is moving
ready = 0;

//Hits
hp = 3;

//Facing direction
xscale = 1;
prevxscale = 1;

//Do not animate
image_speed = 0;
image_index = 0;

//Begin movement
alarm[10] = 90;