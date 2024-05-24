/// @description Track Fuzzy

//How vulnerable is this enemy to various items?
vulnerable = 1;

//How vulnerable is this enemy to Mario?
stomp = 2;

//How edible is this enemy to Yoshi?
edible = 0;

//NPC Health
hp = 0;
firehp = 0;

//Ignore Platforms
ignore_platforms = true;

//Makes the NPC invulnerable to projectiles after being hit by one
invulnerable = 0;

//State
state = "IDLE";

//Speed
spd = 1.5;
st_spd = spd;

//Origin
xorig = 0;
yorig = 7;

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

//Freeze Sprite
freeze_sprite = -1;

//Freeze Object
freeze_object = -1;

//Start moving
alarm[10] = 2;