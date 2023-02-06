/// @description Render me

#region DISPLAY USES LEFT
	
	draw_set_font(global.gui_font_numbers);
	draw_set_halign(fa_center);
	draw_text_colour(x, bbox_top-10, string(max_uses), c_white, c_white, c_white, c_white, 0.7);
	draw_set_halign(fa_left);

#endregion

//Set up palette
pal_swap_set(spr_palette_trampoline, 3);

//Inherit the parent event
event_inherited();

//Reset up palette
pal_swap_reset();