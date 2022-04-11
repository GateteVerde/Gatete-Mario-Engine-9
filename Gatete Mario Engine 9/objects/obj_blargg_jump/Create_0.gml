/// @description Blargg when it's jumping

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 99;

//How vulnerable is this enemy to Mario?
//0:	Normal
//1:	Hurt Mario
//2:	Hurt Mario + Immune to Mounts
//3:	Subcon
//4:	Stomp (Custom)
//-1:	Phase through Mario
stomp = 1;

//How edible is this enemy to Yoshi?
//0:	Edible
//1:	Edible, but create a item
//2:	Non-Edible
edible = 2;

//Does this enemy turn into a silver coin?
//0:	No
//1:	Yes
turn_silver = 0;

//Set vertical speed
yspeed = -2.85;
yadd = 0.12;

//Depth
depth = 150;

//Move towards Mario
if (!instance_exists(obj_mario))
|| (obj_mario.x < x)
    xspeed = -0.75;
else
    xspeed = 0.75;
