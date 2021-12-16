/// @description Render me

//If the trampoline has been picked up, show time left
if (ready3 == 1) {
	
	draw_set_font(global.gui_font_numbers);
	draw_set_halign(fa_center);
	draw_text_colour(x, bbox_top-10, string(1 + (alarm[2] div 60)), c_white, c_white, c_white, c_white, 0.7);
	draw_set_halign(fa_left);
}

//Set up palette
pal_swap_set(spr_palette_trampoline, 1);

//Inherit the parent event
event_inherited();

//Reset up palette
pal_swap_reset();