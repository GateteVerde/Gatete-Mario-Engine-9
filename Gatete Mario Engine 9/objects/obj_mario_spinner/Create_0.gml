/// @description Spinner Object

//Owner of the spinner for adhering to position
owner = noone;

//Has this object hit a block?
bump = false;

//Set different mask for Ranger Mario
if (global.powerup == cs_ranger)
	mask_index = spr_mario_ranger_attack_mask;