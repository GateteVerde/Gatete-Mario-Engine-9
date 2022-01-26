/// @description Draw the HUD

//Set palette
pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);

//Mario
draw_sprite_ext(global.walk_sprite[global.powerup], anim, camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 24, -1, 1, 0, c_white, image_alpha);
if (global.powerup == cs_cape) {

	draw_sprite_ext(spr_cape_walk, anim, camera_get_view_x(view_camera[0]) + 16, camera_get_view_y(view_camera[0]) + 24, -1, 1, 0, c_white, image_alpha);
}

//Reset palette
pal_swap_reset();

//Set the font
draw_set_font(global.gui_font_large);

//Lives
draw_text_colour(camera_get_view_x(view_camera[0]) + 8, camera_get_view_y(view_camera[0]) + 48, string_format(lives, 2, 0), c_white, c_white, c_white, c_white, image_alpha);

//WORLD + LEVEL
draw_text_colour(camera_get_view_x(view_camera[0]) + 32, camera_get_view_y(view_camera[0]) + 8, "WORLD " + string(global.world) + "-" + string(levelprint), c_white, c_white, c_white, c_white, image_alpha);

//Set the font
draw_set_font(global.gui_font_menu);

//Level name
draw_text_colour(camera_get_view_x(view_camera[0]) + 32, camera_get_view_y(view_camera[0]) + 32, string(levelname), c_white, c_white, c_white, c_white, image_alpha);

//SMB3 Card Holder (Comment this if you are not going to use the SMB3 card system)
draw_sprite_ext(spr_gui_cardbox, 0, camera_get_view_x(view_camera[0]) + 8, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 21, 1, 1, 0, c_white, image_alpha);

//Inventory prompt
draw_sprite_ext(gamepad_set_gui_sprite(), 5, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 24, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 24, 1, 1, 0, c_white, image_alpha);
draw_text_colour(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 100, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 16, "Inventory", c_white, c_white, c_white, c_white, image_alpha);

//Set alpha
draw_set_alpha(inv_alpha);

//Rectangle
draw_rectangle_colour(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]), c_black, c_black, c_black, c_black, false);

//Reset alpha
draw_set_alpha(1);

//Inventory
#region

	//Draw base
	draw_sprite_ext(spr_gui_map_inventory, 0, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - inv_offset_y, 1, 1, 0, c_white, 1);

	//Item Quantities
	#region ITEM QUANTITIES
	
		//Iterate through powerups 0 and 9
		for (var i=0; i<10; i++)		
			draw_text_colour(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 107 + (i) * 22, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 18 - inv_offset_y, string_format(global.inventory[i], 2, 0), c_white, c_white, c_white, c_white, 1);
		
		//Iterate through powerups 10 and 19
		for (var i=10; i<20; i++)
			draw_text_colour(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 107 + (i-10) * 22, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 40 - inv_offset_y, string_format(global.inventory[i], 2, 0), c_white, c_white, c_white, c_white, 1);
		
		//Iterate through powerups 10 and 19
		for (var i=20; i<27; i++)
			draw_text_colour(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - 107 + (i-20) * 22, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 62 - inv_offset_y, string_format(global.inventory[i], 2, 0), c_white, c_white, c_white, c_white, 1);
	#endregion
	
	//Cursor
	if ((obj_mapmario.boxselection >= 0) && (obj_mapmario.boxselection < 10))
		draw_sprite_ext(spr_gui_map_inventory_cursor, anim, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - (99 - obj_mapmario.boxselection * 22), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 10 - inv_offset_y, 1, 1, 0, c_white, 1);
	else if ((obj_mapmario.boxselection >= 10) && (obj_mapmario.boxselection < 20))
		draw_sprite_ext(spr_gui_map_inventory_cursor, anim, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - (99 - (obj_mapmario.boxselection * 22) + 220), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 32 - inv_offset_y, 1, 1, 0, c_white, 1);
	else if ((obj_mapmario.boxselection >= 20) && (obj_mapmario.boxselection < 27))
		draw_sprite_ext(spr_gui_map_inventory_cursor, anim, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - (99 - (obj_mapmario.boxselection * 22) + 440), camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 54 - inv_offset_y, 1, 1, 0, c_white, 1);
		
		
#endregion

//Bar
draw_sprite_tiled_area_ext(spr_gui_map_bar, 0, camera_get_view_x(view_camera[0]) + offset_x, camera_get_view_y(view_camera[0]) - 32 + offset_y, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), camera_get_view_x(view_camera[0]) + global.gw, camera_get_view_y(view_camera[0]) + offset_y - 1, c_white, 1);

//Set font
draw_set_font(global.gui_font_large);

//Draw "Inventory"
draw_text_colour(camera_get_view_x(view_camera[0]) + 8, camera_get_view_y(view_camera[0]) - 28 + offset_y, "INVENTORY", c_white, c_white, c_white, c_white, 1);

//Set font
draw_set_font(global.gui_font_menu);

//Draw "Dir. Button" prompts
draw_sprite_ext(gamepad_set_gui_sprite(), 2, camera_get_view_x(view_camera[0]) + 8, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 8 - offset_y, 1, 1, 0, c_white, 1);
draw_sprite_ext(gamepad_set_gui_sprite(), 3, camera_get_view_x(view_camera[0]) + 28, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 8 - offset_y, 1, 1, 0, c_white, 1);
draw_text_colour(camera_get_view_x(view_camera[0]) + 48, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 16 - offset_y, "MOVE", c_white, c_white, c_white, c_white, 1);

//If the "A" button is shown
if (prompt == 0) {
	
	draw_sprite_ext(gamepad_set_gui_sprite(), 4, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 24, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 8 - offset_y, 1, 1, 0, c_white, 1);
	draw_text_colour(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 84, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 16 - offset_y, "CONFIRM", c_white, c_white, c_white, c_white, 1);
}

//Otherwise, if the "B" and "X" buttons are shown
else if (prompt == 1) {
	
	draw_sprite_ext(gamepad_set_gui_sprite(), 7, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 24, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 8 - offset_y, 1, 1, 0, c_white, 1);
	draw_sprite_ext(gamepad_set_gui_sprite(), 5, camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 32, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 8 - offset_y, 1, 1, 0, c_white, 1);
	draw_text_colour(camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) - 84, camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) + 16 - offset_y, "CANCEL", c_white, c_white, c_white, c_white, 1);
}