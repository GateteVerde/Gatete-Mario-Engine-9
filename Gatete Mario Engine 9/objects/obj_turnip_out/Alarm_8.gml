/// @description Check up the sprite

//If the vegetable is a big one
if (sprite_index == spr_turnip_large)
|| (powerup) {

    drawpiece = 1;
    drawpiece2 = 0;
    depth = 6;
    alarm[1] = 20;
}

//Otherwise if the vegetable is a enemy, a pow or a pullable mushroom block
else {

    if (enemy)
	|| (sprite_index == spr_powblock)
    || (sprite_index == spr_mushblock) {
    
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

//If the vegetable is a mini vegetable
if (sprite_index == spr_turnip_small)
    vspeed--;