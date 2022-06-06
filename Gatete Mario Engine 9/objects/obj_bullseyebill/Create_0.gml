/// @description Bullseye Bill

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 1;

//How vulnerable is this enemy to Mario?
stomp = 0;

//How vulnerable is this enemy to Yoshi?
edible = 0;

//Ignore platforms
ignore_platforms = 1;

//Last Direction
lastdir = direction;
new_dir = 0;
diff = 0;

//Do not animate
image_speed = 0;

//Home at Mario
homing = false;
alarm[0] = 60;
