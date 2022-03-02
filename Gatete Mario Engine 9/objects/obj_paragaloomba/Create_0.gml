/// @description Para-Galoomba

//Inherit the parent event
event_inherited();

//Manage jumps
jumping = 0;

//Manage wing animation
anim = 0;

//How edible is this NPC to Yoshi?
edible = 1;

//Frozen sprite
freeze_sprite = spr_paragaloomba_frozen;

//Move towards the player and begin flight
alarm[10] = 2;