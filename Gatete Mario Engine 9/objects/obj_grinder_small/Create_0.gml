/// @description Small Grinder

//How vulnerable is this enemy to various items?
vulnerable = 99;

//How vulnerable is this enemy to Mario?
stomp = 2;

//How edible is this enemy to Yoshi?
edible = 2;

//Does this enemy turn on ledges?
turn_on_ledges = 0;

//Does this enemy turn into a silver coin?
turn_silver = 0;

//NPC Health
hp = 0;
firehp = 0;

//Makes the NPC invulnerable to projectiles after being hit by one
invulnerable = 0;

//State
state = "IDLE";

//Speed
spd = 1.5;
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