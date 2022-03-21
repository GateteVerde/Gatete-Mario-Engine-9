/// @description Hammer Bro

//Inherit the parent event
event_inherited();

//Whether can go through solid
throughsolid = 0;

//Number of hammers to throw
hammers = 1+random(round(3));

//Freeze sprite (Used mainly for enemies that require extra parts to be drawn)
freeze_sprite = spr_hammerbro;

//Save alarms
for (i=0; i<12; i++) {
	
	save_alm[i] = -1;
}
//Jump upwards / downwards
alarm[0] = 4;

//Set the throwing pose
alarm[1] = 7;

//Move
alarm[10] = 2;