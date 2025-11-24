/// @description Digging Monty Mole

//Inherit the parent event
event_inherited();

//How vulnerable is this enemy to various items?
vulnerable = 100;

//How vulnerable is this enemy to Mario?
stomp = -1;

//How vulnerable is this enemy to Yoshi?
edible = -1;

//Ignore platforms
ignore_platforms = false;

//Set a different sprite if placed in ground
if (place_meeting(x, y+1, obj_semisolid))
	sprite_index = spr_montymole_dig;