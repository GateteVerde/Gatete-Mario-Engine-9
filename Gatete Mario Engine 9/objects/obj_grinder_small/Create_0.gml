/// @description Small Grinder

//How vulnerable is this enemy to various items?
//0:	Normal
//1:	Immune to fireballs
//2:	Immune to all projectiles
//99:	Immune
//100:	Immune + Ignore projectiles
vulnerable = 2;

//How vulnerable is this enemy to Mario?
//0:	Normal
//1:	Hurt Mario
//2:	Hurt Mario + Immune to Mounts
//3:	Subcon
//4:	Stomp (Custom)
//-1:	Phase through Mario
stomp = 2;

//How edible is this enemy to Yoshi?
//0:	Edible
//1:	Edible, but create a item
//2:	Non-Edible
edible = 2;

//State
state = "IDLE";

//Speed
spd = 2;
st_spd = spd;

//Origin
xorig = 0;
yorig = 15;

//Steps to take per steps
step = 0;

//Whether the grinder jumped from a track
ready = 0;

//Whether the grinder is frozen
freeze = 0;

//Direction
direct = 270;

//Facing direction
xscale = 1;

//Play 'Engine' sound
alarm[1] = 15;

//Start moving
alarm[10] = 2;