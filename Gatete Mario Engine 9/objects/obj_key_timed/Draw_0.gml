/// @description Draw NPC

//If the trampoline has been picked up, show time left
if (ready3 == 1) {
	
	draw_set_font(global.gui_font_numbers);
	draw_set_halign(fa_center);
	draw_text_colour(x, bbox_top-10, string(1 + (alarm[1] div 60)), c_white, c_white, c_white, c_white, 0.7);
	draw_set_halign(fa_left);
}

//Render key
draw_sprite_ext(sprite_index, image_index, screen_round(x), screen_round(y + 1), dir, 1, image_angle, image_blend, image_alpha);