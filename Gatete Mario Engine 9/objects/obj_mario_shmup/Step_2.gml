/// @description Set up sprite and mask

//If this is a water shmup level
if (subpop == true) {
	
	sprite_index = (global.powerup == cs_small) ? global.subpop_small_sprite : global.subpop_sprite;
	mask_index = (global.powerup == cs_small) ? spr_mask_mario : spr_mask_mario_big;
}

//Otherwise
else if (subpop == false) {
	
	sprite_index = (global.powerup == cs_small) ? global.skypop_small_sprite : global.skypop_sprite;
	mask_index = (global.powerup == cs_small) ? spr_mask_mario : spr_mask_mario_big;
}