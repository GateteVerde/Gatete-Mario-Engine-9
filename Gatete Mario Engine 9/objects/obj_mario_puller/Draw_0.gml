/// @description Render me

//If Mario does exist
if (instance_exists(obj_mario)) {

	//Set up the palette
	pal_swap_set_player(spr_palette, spr_palette_invincible);
    
    //If the player is pulling
    if (sprite_index == global.pull_sprite[global.powerup])
        draw_sprite_ext(global.pull_sprite[global.powerup], -1, round(x), round(y)+1, obj_mario.xscale, 1, 0, c_white, obj_mario.image_alpha);
        
    //Otherwise, draw the crouched down pose
    else
        draw_sprite_ext(global.duck_sprite[global.powerup], 1, screen_round(x), screen_round(y)+1, obj_mario.xscale, 1, 0, c_white, obj_mario.image_alpha);
    
    //Reset shader
    pal_swap_reset();
}