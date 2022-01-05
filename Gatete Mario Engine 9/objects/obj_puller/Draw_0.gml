/// @description Render me

//If Mario does exist
if (instance_exists(obj_mario)) {

	//Set up the palette
	pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);
    
    //If the player is pulling
    if (sprite_index == spr_mario_pull)
        draw_sprite_ext(spr_mario_pull, ((global.powerup) * 2)+frame, round(x), round(y)+1, obj_mario.xscale, 1, 0, c_white, obj_mario.image_alpha);
        
    //Otherwise, draw the crouched down pose
    else
        draw_sprite_ext(global.duck_sprite[global.powerup], 1, screen_round(x), screen_round(y)+1, obj_mario.xscale, 1, 0, c_white, obj_mario.image_alpha);
    
    //Reset shader
    pal_swap_reset();
}