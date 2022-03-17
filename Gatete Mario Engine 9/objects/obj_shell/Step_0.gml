/// @description Koopa Shell logic

//Inherit the parent event
event_inherited();

//Set shell mask
if (sprite_index == spr_shell_big) 
|| (sprite_index == spr_shell_red_big) {
	
	edible = 2;
	mask_index = spr_mask_npc_common_32x32;
}