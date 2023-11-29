/// @description Draw Mario

//Animate stun effect
stunanim += 0.5;

//If no flying object exists
if (fly != noone)
	return;

//Set up the palette
pal_swap_set_player(global.palette[global.player].main, global.palette[global.player].star, global.palette[global.player].mega);

//Draw Mario
if (sprite_index > -1) {
	
	switch (global.powerup) {
		
		//Mega
		case (cs_mega): {
			
			draw_sprite_custom_origin(sprite_index, image_index, screen_round(x), screen_round(y)+1, sprite_get_xoffset(sprite_index), sprite_height, 4*xscale, 4*yscale, 0, image_blend, image_alpha);
		} break;
	
		//Rest of sprites
		default: {
			
			//If Mario is doing a somersault or is about to perform a ground pound
			if ((somersault == 1) || (groundpound == 1)) {
				
				//If Mario is small
				if (global.powerup == cs_small)
					draw_sprite_custom_origin(sprite_index, image_index, screen_round(x), screen_round(y)+9, sprite_get_xoffset(sprite_index), 8, xscale, yscale, angle, image_blend, image_alpha);
				else
					draw_sprite_custom_origin(sprite_index, image_index, screen_round(x), screen_round(y)+1, sprite_get_xoffset(sprite_index), 16, xscale, yscale, angle, image_blend, image_alpha);				
			}
			else {
				
				//Draw
				draw_sprite_custom_origin(sprite_index, image_index, screen_round(x), screen_round(y) + 1 + shake, sprite_get_xoffset(sprite_index), sprite_height, xscale, yscale, 0, image_blend, image_alpha);
				if (stuntime > 0) {
					
					draw_sprite_ext(spr_shake, stunanim, screen_round(x), screen_round(y)+1, 1, 1, 0, c_white, 1);
				}
				
				//If Mario is ready to do a squat jump, draw again but with additive blending
				if (squat_time > 119)
				&& (squat_time mod 6 == 1) {

					//Set blend mode
					gpu_set_blendmode(bm_add);
					
					//Render
					if (image_alpha > 0) {
						
						draw_sprite_custom_origin(sprite_index, image_index, screen_round(x), screen_round(y) + 1 + shake, sprite_get_xoffset(sprite_index), sprite_height, xscale, yscale, 0, image_blend, 1);
					}
					
					//Reset blending
					gpu_set_blendmode(bm_normal);
				}
			}
		}
	}
}

//Reset the palette
pal_swap_reset();

//Draw the mask currently used
if (debug_mode) {
	
	draw_sprite(mask_index, -1, screen_round(x), screen_round(y));
	draw_text(x-4, bbox_top - 16, string(jumping) + ", " + string(yspeed));
}