/// @description Draw the block

//If the block has not been bumped yet
if (ready < 2) {

	//If the item shown is a Bomb or a Propeller Shroom
	if (sprout[numb] == cs_bomb)
	|| (sprout[numb] == cs_propeller)
	    draw_sprite_part(macro_get_sprite(sprout[numb]), 0, 0, 5, 16, 21, round(x), round(y));
	else {

		//If the item shown is a Raccoon Leaf. Draw the _sp variant
	    if (sprout[numb] == cs_raccoon)
	        draw_sprite(spr_leaf_sp, 0, round(x)+8, round(y));
			
		//Otherwise, if the item show is a Mega Mushroom. Draw the _block variant
		else if (sprout[numb] == cs_mega)
			draw_sprite(spr_megashroom_block, 0, round(x)+8, round(y));
	    else
	        draw_sprite(macro_get_sprite(sprout[numb]), 0, round(x)+8, round(y));
	}
}

//Draw the block
draw_sprite(sprite_index, 0, round(x), round(y));