/// @description Render me

if (gy > 0) {

    //Draw torpedo
    if (ready == 1) {
    
        draw_sprite_ext(spr_torpedoted, 0, screen_round(x)+16, screen_round(y)+16+gy, gx, 1, 0, c_white, 1);
    }
	
	//Draw glove
    draw_sprite_ext(sprite_index, 1+gi, screen_round(x), screen_round(y)+gy, 1, 1, 0, c_white, 1);
}

//Draw box
draw_sprite(sprite_index, 0, screen_round(x), screen_round(y));
