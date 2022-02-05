/// @description Draw the HUD

//Set font
draw_set_font(global.gui_font_menu);

#region Inventory

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

//Border
draw_sprite_stretched_ext(spr_gui_map_border, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), global.gw, global.gh, c_white, 1);

#region Render Mario and Lives

	//Set palette
	pal_swap_set_player(spr_palette_mario, spr_palette_mario_invincible);

	//Draw Cape
	if (global.powerup == cs_cape) {

		draw_sprite_ext(spr_cape_walk, anim, camera_get_view_x(view_camera[0]) + 32, camera_get_view_y(view_camera[0]) + 16, -1, 1, 0, c_white, 1);
	}
	
	//Draw Mario
	draw_sprite_ext(global.walk_sprite[global.powerup], anim, camera_get_view_x(view_camera[0]) + 32, camera_get_view_y(view_camera[0]) + 16, -1, 1, 0, c_white, 1);
	
	//Reset palette
	pal_swap_reset();

	//Lives
	draw_text_colour(camera_get_view_x(view_camera[0]) + 40, camera_get_view_y(view_camera[0]) + 24, "* " + string_format(lives, 2, 0), c_white, c_white, c_white, c_white, 1);

#endregion

//Set font
draw_set_font(global.gui_font);

#region Render Level Name + Star Coins

	//If the level does have a ID
	if (levelid != noone) {
    
	    //Draw the coin spot
	    draw_sprite_ext(spr_gui_global_sc, 0, camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 8, 1, 1, 0, c_white, 1);
    
	    //Draw the coins
	    for (var i = 0; i < 3; i++) {
                
			//If the coins were collected
	        if (ds_map_find_value(global.sc[i], levelid) > 0) {
                
	            if (ds_map_find_value(global.sc[i], levelid) == 2)
	                draw_sprite_ext(spr_gui_global_sc_coin, anim, camera_get_view_x(view_camera[0]) + 80 + (16*i), camera_get_view_y(view_camera[0]) + 8, 1, 1, 0, c_white, 1);
	            else
	                draw_sprite_ext(spr_gui_global_sc_coin, 0, camera_get_view_x(view_camera[0]) + 80 + (16*i), camera_get_view_y(view_camera[0]) + 8, 1, 1, 0, c_white, 1);
	        }
	    }
	}
	
	//Render level name
	draw_text_colour(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 24, string(levelname), c_white, c_white, c_white, c_white, 1);

#endregion