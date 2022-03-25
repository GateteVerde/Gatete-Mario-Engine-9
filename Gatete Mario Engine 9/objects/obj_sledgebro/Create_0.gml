/// @description Sledge Bro

//Inherit event from parent
event_inherited();

//Check if jump
jumping = 0;

//Remember prev.hspeed
prevxspeed = 0;

//Freeze sprite (Used mainly for enemies that require extra parts to be drawn)
freeze_sprite = spr_sledgebro;

//Save alarms
for (i=0; i<12; i++) {
	
	save_alm[i] = -1;
}

//Jump
alarm[0] = 302;

//Set the throwing frame.
alarm[2] = 62;

//Start moving
alarm[10] = 2;