/// @description Unfreeze Fire Bro

//Inherit the parent event
event_inherited();

//Remember all alarms
for (i=0; i<12; i++) {

	alarm[i] = save_alm[i];
	save_alm[i] = 0;
}