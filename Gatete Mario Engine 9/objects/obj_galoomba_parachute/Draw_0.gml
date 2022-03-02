///Draw Parachute Galoomba

//If the galoomba is moving down
if (ready == 0)
    draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y) + 1, 1, 1, 0, c_white, 1);
    
//Otherwise, draw both parachute and galoomba
else {

    //Draw the parachute
    if (ready < 2) {
    
        draw_sprite_ext(spr_galoomba_parachute_land, 1, screen_round(x), screen_round(y) + 1 + para_y, 1, 1, 0, c_white, 1);
    }
    
    //Draw the galoomba
    draw_sprite_ext(spr_galoomba_parachute_land, 0, screen_round(x), screen_round(y) + 1, 1, 1, 0, c_white, 1);
}
