/// @description Freeze Hammer Bro

//Inherit the parent event
event_inherited();

//Remember all alarms
for (i=0; i<12; i++) {

	save_alm[i] = alarm[i];
	alarm[i] = 0;
}