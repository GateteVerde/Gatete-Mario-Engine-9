/// @description Boomerang Bro

//Inherit the parent event
event_inherited();

//Freeze sprite (Used mainly for enemies that require extra parts to be drawn)
freeze_sprite = spr_boomerangbro;

//Save alarms
for (i=0; i<12; i++) {
	
	save_alm[i] = -1;
}

//How many boomerangs did this enemy threw?
throws = 0;

//Jump upwards / downwards
alarm[0] = 4;

//Prepare a boomerang to throw
alarm[1] = 7;

//Move
alarm[10] = 2;