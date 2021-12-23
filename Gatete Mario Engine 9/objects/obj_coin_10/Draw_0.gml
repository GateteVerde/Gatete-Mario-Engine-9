/// @description Render me

//Temp variable
pal = (ready != 0) ? 1 : 0;

//Set up palette
pal_swap_set(spr_palette_coin, pal);

//Inherit the parent event
event_inherited();

//Reset palette
pal_swap_reset();