/// @description Render yoshi

//Set palette
pal_swap_set(spr_palette_yoshi, colour);

//Inherit the parent event
event_inherited();

//Reset palette
pal_swap_reset();