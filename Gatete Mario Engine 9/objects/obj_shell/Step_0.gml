/// @description Koopa Shell logic

//Inherit the parent event
event_inherited();

//This is a shell
is_shell = 1;

//Set flags depending of sprite
switch (sprite_index) {

	//Big Shell, Red Big Shell
	case (spr_shell_big):
	case (spr_shell_red_big): {
	
		edible = 2;
		mask_index = spr_mask_npc_common_32x32;
	} break;
	
	//Buzzy Beetle
	case (spr_shell_buzzy): {
		
		vulnerable = 1;
		edible = 0; 
	} break;
	
	//Koopatrol
	case (spr_shell_koopatrol): {
	
		vulnerable = 1;
		edible = 1;
	} break;
}