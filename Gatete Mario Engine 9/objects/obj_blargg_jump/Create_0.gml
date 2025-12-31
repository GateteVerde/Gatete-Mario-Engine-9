/// @description Blargg when it's jumping

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 99;

//How vulnerable is this enemy to Mario?
stomp = 2;

//How edible is this enemy to Yoshi?
edible = 2;

//Does this enemy turn into a silver coin?
turn_silver = 0;

//Ignore platforms
ignore_platforms = true;

//Set vertical speed
yspeed = -2.85;
yadd = 0.12;

//Depth
depth = 100;

//Move towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xspeed = -0.75;
else
    xspeed = 0.75;
