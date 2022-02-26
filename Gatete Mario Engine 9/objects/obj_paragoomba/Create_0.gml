/// @description Paragoomba

//Inherit the parent event
event_inherited();

//Manage flight
flying = 0;

//Manage wing animation
anim = 0;

//Frozen sprite
freeze_sprite = spr_paragoomba_frozen;

//Move towards the player and begin flight
alarm[10] = 2;