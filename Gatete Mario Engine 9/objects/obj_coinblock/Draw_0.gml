/// @description Render me

//Draw snapshot
if (ready2 == 1) {
	
	freeze_render();
}

//Draw object
draw_sprite_ext(sprite_index, -1, screen_round(x), screen_round(y), 1, 1, 0, c_white, 1);
