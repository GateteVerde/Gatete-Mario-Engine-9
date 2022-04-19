/// @description Dolphin (Straight)

//Inherit the parent event
event_inherited();

//How vulnerable is this NPC to various items?
vulnerable = 100;

//How vulnerable is this NPC to Mario?
stomp = 3;

//How vulnerable is this NPC to Yoshi?
edible = 2;

//Is this enemy heavy?
isheavy = 2;

//No swimming
noswim = 1;

//Set up semisolid mask
mytop.mask_index = sprite_index;
