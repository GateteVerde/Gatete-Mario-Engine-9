/// @description Engine

/*
//	This object uses creation code
//
//	gizmo	= Pick from below
//			0: Rope (Set up height with the variable below)
//			1: Pole (Set up height with the variable below)
//			2 / -2: Sawblade (Use -2 for a downwards sawblade)
//
//	height	= Height of the rope (In pixels, only applies to the rope gizmo)
*/			

//Default value
gizmo = 0;
height = 64;

//Animate
image_speed = 0.15;

//State
state = "IDLE";

//Speed
spd = 1;
st_spd = spd;

//Origin
xorig = 7;
yorig = 7;

//Steps to take per steps
step = 0;

//Whether the platform jumped from a track
ready = 0;

//Direction
direct = 270;

//Depth
depth = -2;

//Effects
post = 1;
post_t = 15
alarm[1] = post_t;

//Create the indicated gizmo and start moving
part = noone;
alarm[10] = 2;