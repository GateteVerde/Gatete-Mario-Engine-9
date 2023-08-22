/// @description Render NPC

//Set fog if invulnerable
if ((invulnerable == true) && (alarm[11] % 2 == 0)) {
	
	gpu_set_fog(true, c_yellow, 0, 1);
}

#region

	if (ready == 0)
		draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y + 1), xscale, 1, image_angle, image_blend, image_alpha);
	else
		draw_sprite_custom_origin(sprite_index, image_index, screen_round(x), screen_round(y + 1), 24, 24, xscale, 1, angle, image_blend, image_alpha);
	
#endregion

//Disable fog
gpu_set_fog(false, c_white, 0, 1);