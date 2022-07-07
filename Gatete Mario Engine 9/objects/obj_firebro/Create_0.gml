/// @description Fire Bro

//Inherit event from parent
event_inherited();

//Freeze sprite (Used mainly for enemies that require extra parts to be drawn)
freeze_sprite = spr_firebro;

//Previous horizontal speed
prevxspeed = 0;

//Jump
alarm[0] = 152;

//Set the spit pose
alarm[1] = 60;

//Move
alarm[10] = 2;