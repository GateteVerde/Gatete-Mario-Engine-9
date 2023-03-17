/// @description Set up sprite and mask

//If this is a water shmup level
if (subpop == true) {
	
	sprite_index = (global.powerup == cs_small) ? spr_mario_subpop_small : spr_mario_subpop;
	mask_index = (global.powerup == cs_small) ? spr_mask_mario : spr_mask_mario_big;
}

//Otherwise
else if (subpop == false) {
	
	sprite_index = (global.powerup == cs_small) ? spr_mario_skypop_small : spr_mario_skypop;
	mask_index = (global.powerup == cs_small) ? spr_mask_mario : spr_mask_mario_big;
}