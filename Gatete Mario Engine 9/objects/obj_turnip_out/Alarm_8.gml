/// @description Check up the sprite

//If the vegetable is a big one
if (sprite_index == spr_turnip_large)
|| ((sprite_index == spr_powblock_red_large_up) && (partial == true))
|| (powerup) {

    drawpiece = 1;
    drawpiece2 = 0;
    depth = 6;
    alarm[1] = 20;
}

//Otherwise if the vegetable is a enemy, a pow or a pullable mushroom block
else {

    if (enemy)
	|| (sprite_index == spr_mblock_up)
	|| (sprite_index == spr_crystal)
	|| (sprite_index == spr_vegshroom)
    || (sprite_index == spr_vegshroom_1up)
    || (sprite_index == spr_powblock_red_up) 
	|| (sprite_index == spr_powblock_red_large_up) 
	|| (sprite_index == spr_flipblock_big_held) {
	
        drawpiece2 = 3;
        if ((sprite_width > 16) && (sprite_height > 16))
			alarm[5] = 9;
        else
            alarm[5] = 3;
    }
    else {
    
        drawpiece2 = 3;
        alarm[0] = 1;
    }
}
	
//If the vegetable is a shell
if (sprite_index == spr_turnip_shell) {
	
	image_speed = 0;
	image_index = 0;
}