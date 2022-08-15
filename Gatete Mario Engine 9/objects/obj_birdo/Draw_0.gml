/// @description Render NPC

//Set fog if invulnerable
if ((invulnerable == true) && (alarm[11] % 4 == 0)) {
	
	gpu_set_fog(true, c_yellow, 0, 1);
}

//Draw NPC
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y + 1), xscale, yscale, image_angle, image_blend, image_alpha);

//Disable fog
gpu_set_fog(false, c_white, 0, 1);