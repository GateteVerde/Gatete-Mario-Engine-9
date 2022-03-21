/// @description Draw Yoshi and the current player

//If Mario exists
if (instance_exists(obj_mario)) {
    
    //Set palette
    pal_swap_set(spr_palette_yoshi, colour);
    
    //Draw Yoshi
    draw_sprite_ext(sprite_index, -1, screen_round(x)+obj_mario.shake, screen_round(y)+1, image_xscale, 1, 0, c_white, 1);
    
    //Reset shader
    pal_swap_reset();

    //Draw the player
    event_user(2);
    
    //Draw yoshi's wing
	if (mouthholder == obj_shell_kicked)
    && (instance_number(obj_yoshi_tongue) == 0) {
    
        if (colour == 3)
        || (mouthsprite == spr_shell_blue)
		|| (mouthsprite == spr_shell_spin)
            draw_sprite_ext(spr_wing, flyanim, screen_round(x), screen_round(y)+1+(3 * obj_mario.crouch), image_xscale, 1, 0, c_white, 1);
	}
}