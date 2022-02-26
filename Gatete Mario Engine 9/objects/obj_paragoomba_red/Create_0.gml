/// @description Red Paragoomba

//Inherit the parent event
event_inherited();

//Manage jumps
jumping = 0;

//Manage wing animation
anim = 0;

//Frozen sprite
freeze_sprite = spr_paragoomba_red_frozen;

//Move towards the player and begin flight
alarm[10] = 2;